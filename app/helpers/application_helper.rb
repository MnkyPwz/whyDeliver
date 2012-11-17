module ApplicationHelper
  
  def current_merchant
    Merchant.find_by_id(session[:merchant_id])
  end
end
