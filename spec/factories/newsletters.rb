# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :newsletter do
    name "MyString"
    body "MyText"
    category_ids [FactoryGirl.create(:category).id]
  end
end
