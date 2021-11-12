class Friendship < ApplicationRecord
  belongs_to :friend, class_name: 'User'
  belongs_to :user
  validates_uniqueness_of :friend_id, scope: :user_id

  def friend_name
    friend.name
  end
end
