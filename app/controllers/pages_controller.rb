class PagesController < ApplicationController

  layout "application", :except => [:map]

  def landing
  end

  def dashboard
    @my_orders = current_merchant.orders
    @order = Order.new
  end
  
  def fakeiphone
  end
  
  def map
    @transporter = Transporter.last
  end
  
end
