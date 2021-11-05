FactoryBot.define do
  factory :resort do
    id { Faker::Number.within(range: 1..100) }
    name { Faker::Mountain.name }
  end
end
