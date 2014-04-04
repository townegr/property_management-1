# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "John"
    sequence(:last_name) { |n| "Doe #{n}th"}
    email "john.doe@igoogle.com"
    company_name "Fantastic Four"
  end
end
