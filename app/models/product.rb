class Product < ApplicationRecord

  include Filterable

  validates :title, :description, :price, :in_stock, presence: true
  validate :correct_avatar_type

  scope :filter_by_category, -> (category) { joins(:category).where(:categories => { :name => category.downcase }) }
  scope :filter_by_brand, -> (brand) { joins(:brand).where(:brands => { :name => brand.downcase }) }
  scope :filter_by_price_lte, -> (price) { where("price <= ?", price) }
  scope :filter_by_price_gte, -> (price) { where("price >= ?", price) }
  # scope :filter_by_seller, -> (seller) { joins(:store).where(:stores => { :user_id => seller }) }
  # scope :filter_by_seller, -> (seller) { where(:seller_id => seller.to_i) }

  scope :search_by_title_or_description, -> (q) { where("lower(title) like ? or lower(description) like ?", "%#{q.downcase}%", "%#{q.downcase}%") }

  belongs_to :brand
  belongs_to :category
  belongs_to :store
  has_many_attached :images
  has_many :carts
  has_many :product_adapters

  private

  def correct_avatar_type
    if images.attached?
      images.each do |image|
        if !image.content_type.in?(%w(image/jpeg image/png))
          errors.add(:images, "must be JPEG or PNG.")
        end
      end
      else
        errors.add(:images, "are required.")
    end
  end
end
