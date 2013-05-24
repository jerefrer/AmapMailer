require 'spec_helper'

describe "newsletters/edit" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter,
      :name => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newsletters_path(@newsletter), :method => "post" do
      assert_select "input#newsletter_name", :name => "newsletter[name]"
      assert_select "textarea#newsletter_body", :name => "newsletter[body]"
    end
  end
end
