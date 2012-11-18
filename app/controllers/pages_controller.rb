class PagesController < ApplicationController

  def landing
  end

  def dashboard
    @my_orders = current_merchant.orders
    @order = Order.new
  end
  
  def fakeiphone
  end

  def ipsum
  end
  
end
