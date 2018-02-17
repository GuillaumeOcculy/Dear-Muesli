# == Schema Information
#
# Table name: recipezations
#
#  id         :integer          not null, primary key
#  product_id :integer
#  recipe_id  :integer
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipezation < ApplicationRecord
  belongs_to :product
  belongs_to :recipe
end
