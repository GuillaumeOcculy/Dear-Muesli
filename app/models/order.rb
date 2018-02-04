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
end
