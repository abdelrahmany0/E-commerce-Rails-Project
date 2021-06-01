class AddOrdersToSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :sellers, :order, foreign_key: true
  end
end
