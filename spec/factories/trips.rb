FactoryBot.define do
  factory :trip do
    # association :resort, factory: :resort_option
    resort_id { Faker::Number.within(range: 1..10) }
    # resort_name { Faker::Mountain.name }
    start_date { "2021-11-02" }
    end_date { "2021-11-02" }
  end
end
