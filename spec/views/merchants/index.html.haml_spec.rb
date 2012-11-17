require 'spec_helper'

describe "merchants/index" do
  before(:each) do
    assign(:merchants, [
      stub_model(Merchant,
        :name => "Name",
        :email => "Email",
        :phone => 1,
        :address => "Address",
        :lat => 1.5,
        :long => 1.5
      ),
      stub_model(Merchant,
        :name => "Name",
        :email => "Email",
        :phone => 1,
        :address => "Address",
        :lat => 1.5,
        :long => 1.5
      )
    ])
  end

  it "renders a list of merchants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
