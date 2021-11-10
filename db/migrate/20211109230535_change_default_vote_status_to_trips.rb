class ChangeDefaultVoteStatusToTrips < ActiveRecord::Migration[5.2]
  def change
    change_column_default :trips, :vote_status, from: "Open", to: "open"

  end
end
