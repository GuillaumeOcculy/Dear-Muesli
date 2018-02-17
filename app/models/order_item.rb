# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  order_id    :integer
#  unit_price  :decimal(, )
#  quantity    :integer
#  total_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OrderItem < ApplicationRecord
  # Associations
  belongs_to :product
  belongs_to :order
end
