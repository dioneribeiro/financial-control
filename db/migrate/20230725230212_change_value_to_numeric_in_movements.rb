class ChangeValueToNumericInMovements < ActiveRecord::Migration[7.0]
  def change
    change_column :movements, :value, :numeric, precision: 10, scale: 4
  end
end
