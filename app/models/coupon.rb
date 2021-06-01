class Coupon < ApplicationRecord
    validates :name, :percentage_of_discount, :num_of_use, presence: true
    # def percentage?
    #     percentage_of_discount  == 1.0
    # enddb
end
