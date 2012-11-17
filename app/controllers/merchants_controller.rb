class MerchantsController < ApplicationController
  # GET /merchants
  # GET /merchants.json
  def index
    @merchants = Merchant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @merchants }
    end
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
    @merchant = Merchant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @merchant }
    end
  end

  # GET /merchants/new
  # GET /merchants/new.json
  def new
    @merchant = Merchant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @merchant }
    end
  end

  # GET /merchants/1/edit
  def edit
    @merchant = Merchant.find(params[:id])
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @merchant = Merchant.new(params[:merchant])
    
    # Stripe.api_key = STRIPE_TEST_SECRET
    # token = params[:stripeToken]
    # 
    # customer = Stripe::Customer.create(
    #   :card => token,
    #   :description => "Andrew Chambers"
    # )
     
    # raise "Check if Customer Created"
    # charge = Stripe::Charge.create(
    #   :amount => 2000,
    #   :currency => "usd",
    #   :card => token,
    #   :description => "payinguser@example.com"
    # )

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Merchant was successfully created.' }
        format.json { render json: @merchant, status: :created, location: @merchant }
      else
        format.html { render action: "new" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /merchants/1
  # PUT /merchants/1.json
  def update
    @merchant = Merchant.find(params[:id])

    respond_to do |format|
      if @merchant.update_attributes(params[:merchant])
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy

    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :no_content }
    end
  end
end
