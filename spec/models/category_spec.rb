require 'spec_helper'

describe Category do

  it "should not save without a name" do
    attributes = FactoryGirl.attributes_for(:category, :name => nil)
    Category.new(attributes).should_not be_valid
  end

  it "should not save if name is already taken" do
    FactoryGirl.create(:category, :name => "test")
    attributes = FactoryGirl.attributes_for(:category, :name => "test")
    Category.new(attributes).should_not be_valid
  end

end
