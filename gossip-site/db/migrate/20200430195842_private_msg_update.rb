class PrivateMsgUpdate < ActiveRecord::Migration[5.2]
  def change
    add_reference :private_msgs, :sender, index:true
    add_reference :private_msgs, :recipient, index:true
  end
end
