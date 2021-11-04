FactoryBot.define do
  factory :trip do
    association :resort, factory: :resort_option
    start_date { "2021-11-02" }
    end_date { "2021-11-02" }
  end
end
