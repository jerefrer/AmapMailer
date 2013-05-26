require 'spec_helper'

describe "newsletters/index" do
  before(:each) do
    assign(:newsletters, [
      stub_model(Newsletter,
        :name => "Name",
        :body => "MyText",
        :created_at => Time.now
      ),
      stub_model(Newsletter,
        :name => "Name",
        :body => "MyText",
        :created_at => Time.now
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
