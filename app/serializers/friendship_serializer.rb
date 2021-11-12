class FriendshipSerializer
  include JSONAPI::Serializer

  attributes :user_id, :friend_id, :friend_name
end
