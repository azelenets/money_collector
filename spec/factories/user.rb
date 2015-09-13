FactoryGirl.define do
  factory :user do
    first_name { Faker::Faker::Name.first_name }
    last_name { Faker::Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end