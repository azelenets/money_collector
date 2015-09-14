FactoryGirl.define do
  factory :trip do
    description  { Faker::Lorem.sentence }
    end_date  { DateTime.now + 1.day }
    country_ids { [FactoryGirl.create(:country, :with_currencies).id] }
  end
end