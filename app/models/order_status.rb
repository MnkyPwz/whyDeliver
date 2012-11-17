class OrderStatus < ActiveRecord::Base
  attr_accessible :title

  has_many :orders
end
