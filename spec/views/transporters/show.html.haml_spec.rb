require 'spec_helper'

describe "transporters/show" do
  before(:each) do
    @transporter = assign(:transporter, stub_model(Transporter,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => 1,
      :current_lat => 1.5,
      :current_long => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
