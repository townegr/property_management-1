# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "100 Sunshine Road"
    city "Neverland"
    state "MA"
    postal_code 12345
    description "This is my building"
  end
end
