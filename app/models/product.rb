# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  # Associations
  has_many :recipezations, dependent: :destroy
  has_many :recipes, through: :recipezations
  has_many :order_items

  accepts_nested_attributes_for :recipezations
end
