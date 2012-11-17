require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :merchant_id => 1,
      :transporter_id => 1,
      :status_id => 1,
      :destination_lat => 1.5,
      :destination_long => 1.5,
      :address => "MyString",
      :customer_first_name => "MyString",
      :customer_last_name => "MyString",
      :customer_email => "MyString",
      :customer_phone => "MyString",
      :charge => 1,
      :product_name => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_merchant_id", :name => "order[merchant_id]"
      assert_select "input#order_transporter_id", :name => "order[transporter_id]"
      assert_select "input#order_status_id", :name => "order[status_id]"
      assert_select "input#order_destination_lat", :name => "order[destination_lat]"
      assert_select "input#order_destination_long", :name => "order[destination_long]"
      assert_select "input#order_address", :name => "order[address]"
      assert_select "input#order_customer_first_name", :name => "order[customer_first_name]"
      assert_select "input#order_customer_last_name", :name => "order[customer_last_name]"
      assert_select "input#order_customer_email", :name => "order[customer_email]"
      assert_select "input#order_customer_phone", :name => "order[customer_phone]"
      assert_select "input#order_charge", :name => "order[charge]"
      assert_select "input#order_product_name", :name => "order[product_name]"
    end
  end
end
