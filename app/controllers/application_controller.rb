class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_merchant
  	Merchant.last  	
  end
  
end
