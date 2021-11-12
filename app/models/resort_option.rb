class ResortOption < ApplicationRecord
  belongs_to :trip
  validates :resort_id, numericality: true, presence: true

  def counted_votes
    trip.riders.where('riders.vote = ?', resort_id).count
  end
end
