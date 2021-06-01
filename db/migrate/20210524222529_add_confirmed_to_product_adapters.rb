class AddConfirmedToProductAdapters < ActiveRecord::Migration[5.2]
  def change
    add_column :product_adapters, :confirmed, :boolean
  end
end
