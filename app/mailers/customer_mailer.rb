class CustomerMailer < ActionMailer::Base
  default from: "jimmy@whydeliver.com"

  def accepted_order(order)
  	@order=order

  	mail to: @order.customer_email, subject: "#{@order.customer_first_name}, your order from #{@order.merchant.name} has shipped!"
  end

end
