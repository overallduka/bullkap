# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_template do
    name Faker::Name.name
    content Faker::Lorem.sentence(3)
  end
end
