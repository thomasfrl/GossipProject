class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.references :user, index: true
      t.string :title
      t.string :content
    end
  end
end
