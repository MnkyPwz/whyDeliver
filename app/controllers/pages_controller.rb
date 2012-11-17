class PagesController < ApplicationController

  def landing
  end

  def dashboard
    @my_orders = current_merchant.orders
  end
  
  def fakeiphone
  end
end
