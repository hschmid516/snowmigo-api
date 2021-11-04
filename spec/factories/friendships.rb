FactoryBot.define do
  factory :friendship do
    friend_id { Faker::Number.within(range: 1..100) }
    association :user, factory: :user
  end
end
