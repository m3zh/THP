class TagUpdate < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :gossip, :string
    add_column :gossips, :tag, :string
  end
end
