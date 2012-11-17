WhyDeliver::Application.routes.draw do
  get "api/index"


  scope "api" do
    get "get_delivery" => "api#get_delivery"
    get "get_transporter" => "api#get_transporter"
    get "get_merchant" => "api#get_merchant"
  end

end
