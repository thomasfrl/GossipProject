class AddConvIndexToPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :private_messages, :conversation, index: true
  end
end
