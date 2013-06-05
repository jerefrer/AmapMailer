require 'spec_helper'

describe Subscriber do

  it "should not save without a name" do
    attributes = FactoryGirl.attributes_for(:subscriber, :name => nil)
    Subscriber.new(attributes).should_not be_valid
  end

  it "should not save without an email" do
    attributes = FactoryGirl.attributes_for(:subscriber, :email => nil)
    Subscriber.new(attributes).should_not be_valid
  end

  it "should not save if email is taken already" do
    FactoryGirl.create(:subscriber, :email => "some@email.com")
    attributes = FactoryGirl.attributes_for(:subscriber, :email => "some@email.com")
    Subscriber.new(attributes).should_not be_valid
  end

  it "should not save if email is not an email" do
    attributes = FactoryGirl.attributes_for(:subscriber, :email => "test")
    Subscriber.new(attributes).should_not be_valid
    attributes = FactoryGirl.attributes_for(:subscriber, :email => "test@test")
    Subscriber.new(attributes).should_not be_valid
    attributes = FactoryGirl.attributes_for(:subscriber, :email => "test.com")
    Subscriber.new(attributes).should_not be_valid
  end

  it "should never generate the same auth_token" do
    users = FactoryGirl.create_list(:subscriber, 100)
    users.group_by(&:auth_token).find{|k, v| v.size > 1}.should be_nil
  end

end
