WhyDeliver::Application.routes.draw do

  get "/login" => "sessions#new", :as => 'sign_in'
  post "/login" => "sessions#create", :as => 'sign_in'
  get "/sign-up" => "merchants#new", :as => 'sign_up'
  get "/sign_out" => "sessions#destroy", :as => "sign_out"

  get "/pages/map"
  get "/pages/dashboard", :as => "dashboard"

  root :to => "pages#landing"

  resources :statuses

  get "/orders/callback" => "orders#callback"
  resources :orders
  
  resources :transporters

  resources :merchants
  
  get "/dashboard" => "pages#dashboard"

  get "/fakeiphone" => "pages#fakeiphone", :as => 'fakeiphone'
  get "/ipsum" => "pages#ipsum"


  # The priority is based upon order of creation:
  # first created -> highest priority.


  scope "api" do
    get "/order" => "api#get_order"
    post "/order" => "api#create_order"

    get "/orders/:id" => "api#get_orders"

    get "/get_transporter" => "api#get_transporter"
    get "/get_merchant" => "api#get_merchant"
  end

end
