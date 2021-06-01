class ProductAdapter < ApplicationRecord
    belongs_to :product
    belongs_to :purchasable, polymorphic: true

    after_save :update_associable


    default_scope { order(created_at: :asc) }

    private
    def update_associable
        if purchasable.class.name == Cart.name
            # purchasable.set_and_calculate_total
        end
        true
    end
end
