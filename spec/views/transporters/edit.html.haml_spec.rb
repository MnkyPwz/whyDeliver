require 'spec_helper'

describe "transporters/edit" do
  before(:each) do
    @transporter = assign(:transporter, stub_model(Transporter,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => 1,
      :current_lat => 1.5,
      :current_long => 1.5
    ))
  end

  it "renders the edit transporter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transporters_path(@transporter), :method => "post" do
      assert_select "input#transporter_first_name", :name => "transporter[first_name]"
      assert_select "input#transporter_last_name", :name => "transporter[last_name]"
      assert_select "input#transporter_email", :name => "transporter[email]"
      assert_select "input#transporter_phone", :name => "transporter[phone]"
      assert_select "input#transporter_current_lat", :name => "transporter[current_lat]"
      assert_select "input#transporter_current_long", :name => "transporter[current_long]"
    end
  end
end
