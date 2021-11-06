FactoryBot.define do
  factory :trip do
    # association :resort, factory: :resort_option
    name { Faker::Lorem.sentence(word_count: 3) }
    resort_id { Faker::Number.within(range: 1..10) }
    # resort_name { Faker::Mountain.name }
    start_date { "2021-11-02" }
    end_date { "2021-11-08" }
  end
end
