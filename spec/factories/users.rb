FactoryBot.define do
  factory :user do
    name { Faker::Movies::StarWars.character }
    email { Faker.internet.email }
    exp_level { Faker::Number.within(range: 1..10) }
    ski_pass { "MyString" }
    address { Faker::Address.full_address }
    ski_or_board { { Faker::Number.within(range: 1..10) }
    emergency_name { Faker::Movies::LordOfTheRings.character }
    emergency_number { 9284802695 }
  end
end
