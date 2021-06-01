class Store < ApplicationRecord
  validates :name, :summary, presence: true
  belongs_to :user
  has_many :products
  has_and_belongs_to_many :orders
end
