class RelationsMerge < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :city, foreign_key: true
    add_reference :users, :gossip, foreign_key: true
    add_reference :gossips, :tag, foreign_key: true
  end
end
