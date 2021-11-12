FactoryBot.define do
  factory :trip do
    # association :resort, factory: :resort_option
    name { Faker::Lorem.sentence(word_count: 3) }
    start_date { '2021-11-02' }
    end_date { '2021-12-12' }
  end
end
