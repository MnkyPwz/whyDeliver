require 'spec_helper'

describe "statuses/index" do
  before(:each) do
    assign(:statuses, [
      stub_model(Status,
        :message => "Message"
      ),
      stub_model(Status,
        :message => "Message"
      )
    ])
  end

  it "renders a list of statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end
end
