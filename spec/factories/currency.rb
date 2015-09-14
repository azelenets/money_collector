FactoryGirl.define do
  factory :currency do
    name  { Faker::Currency.name }
    code  { Faker::Currency.code }
    collected false

    trait :with_countries do
      before(:create) do |currency, evaluator|
        currency.countries << FactoryGirl.create(:country)
      end
    end
  end
end