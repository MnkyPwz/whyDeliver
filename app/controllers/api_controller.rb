class ApiController < ApplicationController

  respond_to :json

  def index
    @person = { "town" => "john", "name" => "greg" }
    respond_with(@person)
  end


  def get_delivery
    @delivery = { "transporter_name" => "Big Tony", "item" => "Box of Tees" }
    respond_with @delivery

  end

  def get_merchant
    @merchant = { "merchant_name" => "World of T-shirts", "address" => "1500 FU Ln" }
    respond_with @merchant

  end

  def get_transporter
    @transporter = { "transporter_name" => "Big Tony", "phone" => "773-232-2323" }
    respond_with @transporter

  end


end
