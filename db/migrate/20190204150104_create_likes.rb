class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :comment, index: true
      t.references :gossip, index: true
    end
  end
end
