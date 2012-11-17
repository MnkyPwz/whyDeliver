require 'spec_helper'

describe "merchants/new" do
  before(:each) do
    assign(:merchant, stub_model(Merchant,
      :name => "MyString",
      :email => "MyString",
      :phone => 1,
      :address => "MyString",
      :lat => 1.5,
      :long => 1.5
    ).as_new_record)
  end

  it "renders new merchant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => merchants_path, :method => "post" do
      assert_select "input#merchant_name", :name => "merchant[name]"
      assert_select "input#merchant_email", :name => "merchant[email]"
      assert_select "input#merchant_phone", :name => "merchant[phone]"
      assert_select "input#merchant_address", :name => "merchant[address]"
      assert_select "input#merchant_lat", :name => "merchant[lat]"
      assert_select "input#merchant_long", :name => "merchant[long]"
    end
  end
end
