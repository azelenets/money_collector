FactoryGirl.define do
  factory :country do
    name  { Faker::Address.country }
    code  { Faker::Address.country_code }
    visited false

    trait :with_currencies do
      before(:create) do |currency, evaluator|
        currency.currencies << FactoryGirl.create(:currency)
      end
    end
  end
end
