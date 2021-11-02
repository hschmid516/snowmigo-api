class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :host
      t.boolean :driver
      t.integer :budget

      t.timestamps
    end
  end
end
