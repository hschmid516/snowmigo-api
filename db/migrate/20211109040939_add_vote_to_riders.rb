class AddVoteToRiders < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :vote, :integer
  end
end
