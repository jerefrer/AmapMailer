require 'spec_helper'

describe "subscribers/index" do
  before(:each) do
    assign(:subscribers, [
      stub_model(Subscriber,
        :email => "Email",
        :auth_token => "Auth Token",
        :created_at => Time.now
      ),
      stub_model(Subscriber,
        :email => "Email",
        :auth_token => "Auth Token",
        :created_at => Time.now
      )
    ])
  end

  it "renders a list of subscribers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Auth Token".to_s, :count => 2
  end
end
