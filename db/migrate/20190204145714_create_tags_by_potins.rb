class CreateTagsByPotins < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_by_potins do |t|
      t.references :gossip, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
