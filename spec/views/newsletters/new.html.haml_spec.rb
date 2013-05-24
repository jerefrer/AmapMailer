require 'spec_helper'

describe "newsletters/new" do
  before(:each) do
    assign(:newsletter, stub_model(Newsletter,
      :name => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newsletters_path, :method => "post" do
      assert_select "input#newsletter_name", :name => "newsletter[name]"
      assert_select "textarea#newsletter_body", :name => "newsletter[body]"
    end
  end
end
