class PagesController < ApplicationController

  before_filter :authenticate_merchant!, except: [:landing]


  def landing
  end

  def dashboard
    @my_orders = current_merchant.orders
  end
end
