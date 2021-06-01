class AddPercentageOfDiscountToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :percentage_of_discount, :float
  end
end
