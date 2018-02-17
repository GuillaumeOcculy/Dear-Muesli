# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :string           default("in_progress")
#  subtotal   :decimal(, )
#  shipping   :decimal(, )
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  # Associations
  belongs_to :user, required: false
  has_many :order_items
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses

  def place!
    update(status: 'placed')
  end

  def ship!
    update(status: 'shipped')
  end

  def cancel!
    update(status: 'canceled')
  end

  def total_price
    total_item_price + delivery_cost
  end

  def free_delivery?
    total_item_price >= 35
  end

  def total_item_price
    order_items.sum(:total_price)
  end

  def delivery_cost
    free_delivery? ? 0 : 6.2
  end

  def tva
    total_price * 0.05
  end
end
