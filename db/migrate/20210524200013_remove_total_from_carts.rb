class RemoveTotalFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :total
  end
end
