class Api::V1::FriendshipsController < ApplicationController
  def create
    friendship = Friendship.create!(friendship_params)

    render json: FriendshipSerializer.new(friendship), status: :created
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
