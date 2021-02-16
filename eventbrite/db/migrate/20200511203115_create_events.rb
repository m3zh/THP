class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      #t.references :admin, foreign_key: true

      t.timestamps
    end
    #add_foreign_key :events, :users, column: :admin_id
  end
end
