class Trip < ApplicationRecord
  has_many :resort_options, dependent: :destroy
  has_many :riders, dependent: :destroy

  def update_resort_votes
    resort_options.map do |resort_opt|
      resort_opt.update(vote_count: resort_opt.counted_votes)
    end
  end

  def max_vote_resort
    resort_options.order(:vote_count, created_at: :desc).last.resort_id
  end
end
