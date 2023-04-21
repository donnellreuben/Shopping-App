class Product < ApplicationRecord
# VALIDATIONS
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

# ASSOCIATIONS
  has_many :cart_items
  has_many :order_items
  has_many :carts, through: :cart_items
end
