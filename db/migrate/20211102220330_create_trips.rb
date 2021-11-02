class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :resort_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
