class Order < ActiveRecord::Base
  attr_accessible :address, :charge, :customer_email, :customer_first_name, :customer_last_name, :customer_phone, :destination_lat, :destination_long, :merchant_id, :product_name, :status_id, :transporter_id
end
