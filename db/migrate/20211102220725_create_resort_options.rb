class CreateResortOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :resort_options do |t|
      t.references :trip, foreign_key: true
      t.integer :resort_id
      t.integer :vote_count

      t.timestamps
    end
  end
end
