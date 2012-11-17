class Order < ActiveRecord::Base

  require "open-uri"

  attr_accessible :address, :charge, :customer_email, :customer_first_name, :customer_last_name, :customer_phone, :destination_lat, :destination_long, :merchant_id, :product_name, :order_status, :transporter_id, :delivery_distance

  validates :address, :customer_first_name, :customer_last_name, :customer_email, :customer_phone, :product_name, :presence => :true


  belongs_to :merchant

  before_create :geolocate_address, :calculate_shipping_distance

  after_update :charge_customer, :order_acceptance_email, :calculate_driver_eta
  
  private
  def geolocate_address
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address.gsub(/\s/, '+')}&sensor=true"
    response = JSON.parse(open(url).read)
    self.destination_lat = response["results"][0]["geometry"]["location"]["lat"]
    self.destination_long = response["results"][0]["geometry"]["location"]["lng"]
  end

  before_create :default_values

  def default_values
    self.order_status = "pending"
  end

  def calculate_shipping_distance  
    url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{self.merchant.lat},#{self.merchant.long}&destinations=#{self.destination_lat},#{self.destination_long}&sensor=true&mode=driving&units=imperial"
    response = JSON.parse(open(url).read)
    self.delivery_distance = response["rows"][0]["elements"][0]["distance"]["text"].split(/\s/)[0]
    self.charge = (self.delivery_distance * 100)
  end
  
  def charge_customer
    if self.order_status_changed? && self.order_status == "accepted"
      charge = Stripe::Charge.create(
        :amount =>  self.charge,
        :currency => "usd",
        :customer => self.merchant.stripe_customer_id )
    end
  end

  def order_acceptance_email
    if (self.order_status_changed? && self.order_status == 'accepted')
      CustomerMailer.accepted_order(self).deliver
    end
  end
  
  def calculate_driver_eta
  end

end
