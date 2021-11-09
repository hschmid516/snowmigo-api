class AddDefaultToVoteCountForResortOptions < ActiveRecord::Migration[5.2]
  def change
    change_column_default :resort_options, :vote_count, from: nil, to: 0
  end
end
