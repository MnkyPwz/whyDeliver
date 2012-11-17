class Order < ActiveRecord::Base

  require "open-uri"

  attr_accessible :address, :charge, :customer_email, :customer_first_name, :customer_last_name, :customer_phone, :destination_lat, :destination_long, :merchant_id, :product_name, :order_status_id, :transporter_id

  validates :address, :customer_first_name, :customer_last_name, :customer_email, :customer_phone, :product_name, :presence => :true


  belongs_to :merchant
  belongs_to :order_status

  before_save :geolocate_address
  
  private
  def geolocate_address
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address.gsub(/\s/, '+')}&sensor=true"
    response = JSON.parse(open(url).read)
    self.destination_lat = response["results"][0]["geometry"]["location"]["lat"]
    self.destination_long = response["results"][0]["geometry"]["location"]["lng"]
  end

  before_create :default_values

  def default_values
    # if this instance's order_status_id attribute already exists, use it, otherwise set it equal to whatev
    self.order_status ||= OrderStatus.find_by_title("pending")
  end

end
