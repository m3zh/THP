class TablesUpdate < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string
    add_column :gossips, :user, :string
  end
end
