class Product < ApplicationRecord
  has_many :recipezations
  has_many :recipes, through: :recipezations
end
