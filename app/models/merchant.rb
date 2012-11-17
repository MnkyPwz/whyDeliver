class Merchant < ActiveRecord::Base
  attr_accessible :address, :email, :lat, :long, :name, :phone
end
