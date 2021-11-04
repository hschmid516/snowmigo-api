FactoryBot.define do
  factory :user do
    name { Faker::Movies::StarWars.character }
    email { Faker::Internet.email }
    exp_level { Faker::Number.within(range: 1..10) }
    ski_pass { ['Epic', 'Ikon'].sample }
    address { Faker::Address.full_address }
    ski_or_board { Faker::Number.within(range: 1..10) }
    emergency_name { Faker::Movies::LordOfTheRings.character }
    emergency_number { '2813308004' }
  end
end
