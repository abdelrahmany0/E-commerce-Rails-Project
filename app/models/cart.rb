class Cart < ApplicationRecord
  belongs_to :user
  has_many :product_adapters, as: :purchasable




  def calculate_total
     product_adapters.collect {|item| item.valid? ? (item.product.price * item.product_quantity) : 0}.sum
  end
end
