class Recipe < ApplicationRecord
  # Associations
  has_many :recipezations, dependent: :destroy
  has_many :products, through: :recipezations
	validates :name, presence: true, uniqueness: true
	validates :quantity, presence: true

	has_attached_file :picture, styles: { svg: "900x500>", large: "520x520>", medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
