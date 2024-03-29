class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :gossip, foreign_key: true
      t.string :content
      t.string :user
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
