class DropMultiPm < ActiveRecord::Migration[5.2]
  def change
    drop_table :multi_pms
  end
end
