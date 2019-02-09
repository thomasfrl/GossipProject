class CreateConversation < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :participant1, index: true
      t.references :participant2, index: true
    end
  end
end
