class Recipe < ApplicationRecord

	validates :name, presence: true, uniqueness: true
	validates :quantity, presence: true
end
