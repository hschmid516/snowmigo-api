FactoryBot.define do
  factory :rider do
    association :trip, factory: :trip
    association :user, factory: :user
    host { false }
    driver { false }
    budget { Faker::Number.within(range: 1..100) }
  end
end
