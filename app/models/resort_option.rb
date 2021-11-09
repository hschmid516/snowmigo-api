class ResortOption < ApplicationRecord
  belongs_to :trip

  def counted_votes
    trip.riders.where('riders.vote = ?', resort_id).count
  end
end
