# Read about factories at https://github.com/thoughtbot/factory_girl

Category.destroy_all

FactoryGirl.define do
  factory :newsletter do
    sequence(:name) { |n| "Newsletter-#{n}" }
    sequence(:body) { |n| "Body-#{n}" }
    category_ids [FactoryGirl.create(:category).id]
  end
end
