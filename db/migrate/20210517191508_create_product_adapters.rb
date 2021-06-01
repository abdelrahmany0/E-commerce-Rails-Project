class CreateProductAdapters < ActiveRecord::Migration[5.2]
  def change
    create_table :product_adapters do |t|
      t.integer :item_price
      t.integer :product_quantity
      t.references :product, foreign_key: true
      t.references :purchasable, polymorphic: true
      t.timestamps
    end
  end
end
