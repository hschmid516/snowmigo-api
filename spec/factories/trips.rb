FactoryBot.define do
  factory :trip do
    # association :resort, factory: :resort_option
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
