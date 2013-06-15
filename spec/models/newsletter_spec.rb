require 'spec_helper'

describe Newsletter do

  it "should not save without a name" do
    attributes = FactoryGirl.attributes_for(:newsletter, :name => nil)
    Newsletter.new(attributes).should_not be_valid
  end

  it "should not save without a body" do
    attributes = FactoryGirl.attributes_for(:newsletter, :body => nil)
    Newsletter.new(attributes).should_not be_valid
  end

  it "should not save without at least one category" do
    attributes = FactoryGirl.attributes_for(:newsletter, :category_ids => [])
    Newsletter.new(attributes).should_not be_valid
  end
end
