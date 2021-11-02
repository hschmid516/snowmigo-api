FactoryBot.define do
  factory :resort_option do
    trip { nil }
    resort_id { 1 }
    vote_count { 1 }
  end
end
