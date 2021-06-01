class AddNumOfUseToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :num_of_use, :integer
  end
end
