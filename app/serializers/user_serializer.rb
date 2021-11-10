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
    user.trips.map do |trip|
      TripSerializer.new(trip)
    end
  end

  attribute :friends do |user|
    user.friendships.map do |friendship|
      FriendshipSerializer.new(friendship)
    end
  end
end
