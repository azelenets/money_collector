FactoryGirl.define do
  factory :currency do
    name  { Faker::Currency.name }
    code  { Faker::Currency.code }
    collected false
  end
end