class ChangeEnumsToStrings < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :exp_level, :string
    change_column :users, :ski_or_board, :string
  end
end
