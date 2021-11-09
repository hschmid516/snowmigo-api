class Rider < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  def self.by_user_and_trip(user_id, trip_id)
    where("user_id = ? AND trip_id = ?", user_id, trip_id).first
  end
end
