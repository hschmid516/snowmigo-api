class FriendshipSerializer
  include JSONAPI::Serializer

  attributes :user_id, :friend_id
end
