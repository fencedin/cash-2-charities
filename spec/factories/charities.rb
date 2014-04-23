# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :charity do
    name Faker::Company.name
    mission Faker::Company.catch_phrase
    description Faker::Lorem.paragraphs(3).join("")
    founded '2012-04-02'
  end
end
