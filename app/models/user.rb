class User < ApplicationRecord
  has_many :riders, dependent: :destroy
  has_many :trips, through: :riders
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  validates :email, uniqueness: true

  def current_friend(friend)
    friends.where('friend_id = ?', friend.id).present?
  end
end
