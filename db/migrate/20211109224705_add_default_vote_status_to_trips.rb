class AddDefaultVoteStatusToTrips < ActiveRecord::Migration[5.2]
  def change
    change_column_default :trips, :vote_status, from: nil, to: "Open"
  end
end
