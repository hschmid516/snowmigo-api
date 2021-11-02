class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :exp_level
      t.string :ski_pass
      t.string :address
      t.integer :ski_or_board
      t.string :emergency_name
      t.integer :emergency_number

      t.timestamps
    end
  end
end
