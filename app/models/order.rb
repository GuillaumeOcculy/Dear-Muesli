class Order < ApplicationRecord
  # Associations
  belongs_to :user, required: false
  has_many :order_items

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
    item_price + delivery_cost
  end

  def free_delivery?
    item_price >= 35
  end

  def item_price
    order_items.sum(:total_price)
  end

  def delivery_cost
    free_delivery? ? 0 : 6.2
  end

  def tva
    total_price * 0.05
  end
end
