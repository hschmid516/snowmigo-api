class ChangeEmergencyNumberToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :emergency_number, :string
  end
end
