class MerchantsController < ApplicationController
  # before_filter :require_merchant, :except => ['new', 'create']

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
    session[:merchant_id] = @merchant.id
    
    Stripe.api_key = STRIPE_TEST_SECRET
    token = params[:stripeToken]
    
    
    unless @merchant.stripe_customer_id.present? customer = Stripe::Customer.create(
      :card => token,
      :email => @merchant.email
    )
    end
    
    @merchant.update_attributes(:stripe_customer_id => customer["id"])
     
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
  
  private
  def require_merchant
    @merchant = Merchant.find(session[:merchant_id])
  end
  
end
