class AddResortNameToResortOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :resort_options, :resort_name, :string
  end
end
