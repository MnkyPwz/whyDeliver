class ApiController < ApplicationController

  respond_to :json

  protect_from_forgery :except => :create_order

  def index
    @person = { "town" => "john", "name" => "greg" }
    respond_with(@person)
  end


  def get_order
    puts "here"
    puts params[:order_id]

    @order = Order.where("id = ?", params[:order_id]).first
    respond_with @order
  end

  def create_order
    @order = current_merchant.orders.build(params[:order])
    
    respond_to do |format|
      if @order.save
        format.json { render json: @order, status: :created, location: @order }
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_merchant
    @merchant = Merchant.first
    respond_with @merchant 

    #@merchant = { "merchant_name" => "World of T-shirts", "address" => "1500 FU Ln" }
    #respond_with @merchant

  end

  def get_transporter
    @transporter = Transporter.first
    respond_with @transporter
    
    #@transporter = { "transporter_name" => "Big Tony", "phone" => "773-232-2323" }
    #respond_with @transporter

  end

  def get_orders
    @orders = Order.where("merchant_id = ?", params[:id])
    respond_with @orders
  end


end
