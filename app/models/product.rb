class Product < ApplicationRecord
  # Associations
  has_many :recipezations, dependent: :destroy
  has_many :recipes, through: :recipezations
  has_many :order_items
end
