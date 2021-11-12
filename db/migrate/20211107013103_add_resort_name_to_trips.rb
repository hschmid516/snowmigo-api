class AddResortNameToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :resort_name, :string
  end
end
