require 'spec_helper'

feature "Subscriber preferences page" do

  before do
    FactoryGirl.create_list(:category, 3)
  end

  let(:subscriber) { FactoryGirl.create(:subscriber, :auth_token => 'awesome_token') }

  Steps "Greetings" do
    When "I go to sign in page" do
      page.visit "/subscribers/#{subscriber.auth_token}"
    end
    Then "I should see greeting" do
      page.should have_content("Bienvenue #{subscriber.name}")
    end
  end

  Steps "Categories as checkboxes" do
    When "I go to sign in page" do
      page.visit "/subscribers/#{subscriber.auth_token}"
    end
    Then "I should see every category as a check box" do
      Category.all.each do |category|
        page.should have_selector("label", :text => category.name)
        page.should have_selector("form input[type=checkbox][value='#{category.id}']")
      end
    end
  end

end