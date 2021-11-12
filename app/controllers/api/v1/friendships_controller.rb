class Api::V1::FriendshipsController < ApplicationController
  def create
    if invalid_friend
      record_not_found
    else
      if invalid_friendship
          bad_request
      else
        friendship = Friendship.create({user_id: find_user.id, friend_id: find_friend.id})
        render json: FriendshipSerializer.new(friendship), status: :created
      end
    end
  end

  private

  def find_user
    User.find(params[:user_id])
  end

  def invalid_friendship
    find_friend == find_user || find_user.current_friend(find_friend)
  end
end
