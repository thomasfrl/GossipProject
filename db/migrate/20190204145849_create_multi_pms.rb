class CreateMultiPms < ActiveRecord::Migration[5.2]
  def change
    create_table :multi_pms do |t|
      t.references :user, foreign_key: true
      t.references :private_message, index: true
    end
  end
end
