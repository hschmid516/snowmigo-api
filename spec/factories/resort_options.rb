FactoryBot.define do
  factory :resort_option do
    association :trip, factory: :trip
    resort_id { Faker::Number.within(range: 1..100) }
    vote_count { Faker::Number.within(range: 1..10) }
  end
end
