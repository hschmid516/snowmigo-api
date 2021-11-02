FactoryBot.define do
  factory :rider do
    trip { nil }
    user { nil }
    host { false }
    driver { false }
    budget { 1 }
  end
end
