class RemoveTableSeller < ActiveRecord::Migration[5.2]
  def change
    drop_table :sellers
  end
end
