class Transporter < ActiveRecord::Base
  attr_accessible :current_lat, :current_long, :email, :first_name, :last_name, :phone
end
