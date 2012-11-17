class SessionsController < ApplicationController
  def new
  end

  def create
    merchant = Merchant.find_by_email(params[:email])

    if merchant && merchant.authenticate(params[:password])
      session[:merchant_id] = merchant.id
      redirect_to merchant_url(merchant), :notice => "Signed in as #{merchant.email}"
    else
      flash[:notice] = "Sign in unsuccessful."
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully Signed Out"
    redirect_to root_url
  end
end
