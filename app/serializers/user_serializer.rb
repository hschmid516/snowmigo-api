class UserSerializer
  include JSONAPI::Serializer

  attributes :name,
             :email,
             :exp_level,
             :ski_pass,
             :address,
             :ski_or_board,
             :emergency_name,
             :emergency_number
  attribute :trips do |user|
    user.trips
  end

  attribute :friends do |user|
    user.friends
  end
  # has_many :trips
  # has_many :friendships
end
