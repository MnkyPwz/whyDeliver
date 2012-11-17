require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
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
      ),
      stub_model(Order,
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
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Customer First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Email".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Phone".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
  end
end
