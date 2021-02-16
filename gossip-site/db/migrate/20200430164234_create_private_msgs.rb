class CreatePrivateMsgs < ActiveRecord::Migration[5.2]
  def change
    create_table :private_msgs do |t|
      t.text :content

      t.timestamps
    end
  end
end
