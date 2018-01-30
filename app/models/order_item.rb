class OrderItem < ApplicationRecord
  # Associations
  belongs_to :product
  belongs_to :order
end
