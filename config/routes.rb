WhyDeliver::Application.routes.draw do

  get "pages/dashboard", :as => "dashboard"

  root :to => "pages#dashboard"

  resources :statuses

  get "/orders/callback" => "orders#callback"
  resources :orders
  
  resources :transporters

  resources :merchants
  
  get "/fakeiphone" => "pages#fakeiphone", :as => 'fakeiphone'

  # The priority is based upon order of creation:
  # first created -> highest priority.


  scope "api" do
    get "get_delivery" => "api#get_delivery"
    get "get_transporter" => "api#get_transporter"
    get "get_merchant" => "api#get_merchant"
  end

end
