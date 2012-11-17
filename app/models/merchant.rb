class Merchant < ActiveRecord::Base

  require 'open-uri'

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :password_digest, :remember_me
  attr_accessible :address, :email, :lat, :long, :name, :phone
  
  has_secure_password
  
  before_save :geolocate_address
  
  private
  def geolocate_address
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address.gsub(/\s/, '+')}&sensor=true"
    response = JSON.parse(open(url).read)
    self.lat = response["results"][0]["geometry"]["location"]["lat"]
    self.long = response["results"][0]["geometry"]["location"]["lng"]
  end

  has_many :orders

end
