require 'spec_helper'

describe "transporters/index" do
  before(:each) do
    assign(:transporters, [
      stub_model(Transporter,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1,
        :current_lat => 1.5,
        :current_long => 1.5
      ),
      stub_model(Transporter,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1,
        :current_lat => 1.5,
        :current_long => 1.5
      )
    ])
  end

  it "renders a list of transporters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
