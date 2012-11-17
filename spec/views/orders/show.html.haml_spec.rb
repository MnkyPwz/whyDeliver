require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :merchant_id => 1,
      :transporter_id => 2,
      :status_id => 3,
      :destination_lat => 1.5,
      :destination_long => 1.5,
      :address => "Address",
      :customer_first_name => "Customer First Name",
      :customer_last_name => "Customer Last Name",
      :customer_email => "Customer Email",
      :customer_phone => "Customer Phone",
      :charge => 4,
      :product_name => "Product Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Address/)
    rendered.should match(/Customer First Name/)
    rendered.should match(/Customer Last Name/)
    rendered.should match(/Customer Email/)
    rendered.should match(/Customer Phone/)
    rendered.should match(/4/)
    rendered.should match(/Product Name/)
  end
end
