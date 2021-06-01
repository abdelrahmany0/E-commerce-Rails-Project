class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :create_cart

  has_one_attached :avatar
  has_one :cart
  has_many :stores
  validates :name, presence: true

  validate :correct_avatar_type

  private

  def correct_avatar_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
      errors.add(:avatar, "must be JPEG or PNG.")
    elsif !avatar.attached?
      errors.add(:avatar, "is required.")
    end
  end

  def create_cart
    Cart.create({:user_id => id})
    true
  end
end
