class AddProductsToSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :sellers, :product, foreign_key: true
  end
end
