class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.string :image_url
      t.text :description
      t.timestamps
    end
  end
end
