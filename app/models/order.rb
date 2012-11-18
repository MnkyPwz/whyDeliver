class Order < ActiveRecord::Base

  require "open-uri"

  attr_accessible :address, :charge, :customer_email, :customer_first_name, :customer_last_name, :customer_phone, :destination_lat, :destination_long, :merchant_id, :product_name, :order_status, :transporter_id, :delivery_distance, :tracking_number

  validates :address, :customer_first_name, :customer_last_name, :customer_email, :customer_phone, :product_name, :presence => :true


  belongs_to :merchant

  before_create :geolocate_address, :calculate_shipping_distance, :charge_customer, :default_values, :set_tracking_number
  
  after_update :add_driver, :order_acceptance_email, :calculate_driver_eta
  
  #private
  def geolocate_address
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address.gsub(/\s/, '+')}&sensor=true"
    response = JSON.parse(open(url).read)
    self.destination_lat = response["results"][0]["geometry"]["location"]["lat"]
    self.destination_long = response["results"][0]["geometry"]["location"]["lng"]
  end

  

  def default_values
    self.order_status = "pending"
  end

  def calculate_shipping_distance  
    url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{self.merchant.lat},#{self.merchant.long}&destinations=#{self.destination_lat},#{self.destination_long}&sensor=true&mode=driving&units=imperial"
    response = JSON.parse(open(url).read)
    self.delivery_distance = response["rows"][0]["elements"][0]["distance"]["text"].split(/\s/)[0]
    
    self.charge = calculate_charge(self.delivery_distance)
  end
  
  def calculate_charge(distance)   
    if distance >= 3
      return ( ( ( (distance - 3) * 1.60 ) + 12 ) * 100 )  
    else 
      return 1200
    end
  end
  
  def charge_customer
    charge = Stripe::Charge.create(
      :amount =>  self.charge,
      :currency => "usd",
      :customer => self.merchant.stripe_customer_id )
  end

  def order_acceptance_email
    if (self.order_status_changed? && self.order_status == 'accepted')
      CustomerMailer.accepted_order(self).deliver
    end
  end
  
  def calculate_driver_eta
    if self.order_status_changed? && self.order_status == "accepted"
      first_distance = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{self.transporter.current_lat},#{self.transporter.current_long}&destinations=#{self.lat},#{self.long}&sensor=true&mode=driving&units=imperial"
      second_distance = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{self.merchant.lat},#{self.merchant.long}&destinations=#{self.destination_lat},#{self.destination_long}&sensor=true&mode=driving&units=imperial"
      self.delivery_distance = "" 
    end
  end

  def set_tracking_number
    tracking_number = SecureRandom.hex(n=5).upcase
    until Order.find_by_tracking_number(tracking_number) == nil
      tracking_number = SecureRandom.hex(n=5).upcase
    end
    self.tracking_number = tracking_number    
  end

end
