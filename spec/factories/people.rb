# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    name Faker::Name.name
    email Faker::Internet.email
    phone_number Faker::Number.number(11)
    cell_number Faker::Number.number(11)
    twitter Faker::Internet.url('twitter.com')
    facebook Faker::Internet.url('facebook.com')
    instagram Faker::Internet.url('instagram.com')
    bond_id 1
  end

    factory :person_invalid do
    name Faker::Name.name
    email Faker::Internet.email
    phone_number Faker::Number.number(9)
    cell_number Faker::Number.number(9)
    twitter Faker::Internet.url('twitter.com')
    facebook Faker::Internet.url('facebook.com')
    instagram Faker::Internet.url('instagram.com')
    bond_id 1
  end
end
