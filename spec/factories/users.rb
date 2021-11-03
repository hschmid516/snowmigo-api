FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    exp_level { 1 }
    ski_pass { "MyString" }
    address { "MyString" }
    ski_or_board { 1 }
    emergency_name { "MyString" }
    emergency_number { 9284802695 }
  end
end
