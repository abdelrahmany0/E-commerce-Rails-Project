class Order < ApplicationRecord
  enum status: %i[pending confirmed delivered]
  belongs_to :user
  has_and_belongs_to_many :store
  has_many :product_adapter, as: :purchasable

  def current_store_orders(current_user)
    if current_user.stores.empty?
      product_adapter.all
    else
      product_adapter.joins(:product).where("products.store_id = ?", current_user.stores.first.id)

    end
  end

  def custom_total_price(current_user)
    current_store_orders(current_user).collect {|item| item.valid? ? (item.item_price * item.product_quantity) : 0}.sum
  end
end
