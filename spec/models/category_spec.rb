require 'spec_helper'

describe Category do

  it "shouldn't save without a name" do
    attributes = FactoryGirl.attributes_for(:category, :name => nil)
    Category.new(attributes).should_not be_valid
  end

end
