class AddReadToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :read, :boolean, default: false
  end
end
