# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "John"
    last_name "Doe"
    email "john.doe@igoogle.com"
    company_name "Fantastic Four"
  end
end
