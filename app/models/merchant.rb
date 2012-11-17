class Merchant < ActiveRecord::Base

  require 'open-uri'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :email, :lat, :long, :name, :phone
  
  after_commit :geolocate_address
  
  private
  def geolocate_address
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address.gsub(/\s/, '+')}&sensor=true"
    response = JSON.parse(open(url).read)
    self.update_attributes(:lat => response["results"][0]["geometry"]["location"]["lat"], :long => response["results"][0]["geometry"]["location"]["lng"])
  end

  has_many :orders

end
