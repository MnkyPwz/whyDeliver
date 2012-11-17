class Merchants::RegistrationsController < Devise::RegistrationsController
  
  def create
    @merchant = Merchant.new(params[:merchant])
    session[:merchant_id] = @merchant.id
    
    raise session[:merchant_id].to_yaml
    Stripe.api_key = STRIPE_TEST_SECRET
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      :card => token,
      :description => "Andrew Chambers"
    )
     
    raise "Check if Customer Created" 
    # charge = Stripe::Charge.create(
    #   :amount => 2000,
    #   :currency => "usd",
    #   :card => token,
    #   :description => "payinguser@example.com"
    # )
  end
  
end