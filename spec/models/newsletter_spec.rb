require 'spec_helper'

describe Newsletter do

  it "shouldn't save without a name" do
    attributes = FactoryGirl.attributes_for(:newsletter, :name => nil)
    Newsletter.new(attributes).should_not be_valid
  end

  it "shouldn't save without a body" do
    attributes = FactoryGirl.attributes_for(:newsletter, :body => nil)
    Newsletter.new(attributes).should_not be_valid
  end

end