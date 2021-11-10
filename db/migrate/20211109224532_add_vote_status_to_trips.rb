class AddVoteStatusToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :vote_status, :string
  end
end
