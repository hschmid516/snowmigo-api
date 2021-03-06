FactoryBot.define do
  factory :resort_option do
    association :trip, factory: :trip
    resort_id { Faker::Number.within(range: 1..100) }
    resort_name { Faker::Name.first_name }
    vote_count { 0 }
  end
end
