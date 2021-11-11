class AddDefaultHostToRiders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :riders, :host, from: nil, to: false
  end
end
