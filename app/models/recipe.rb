# == Schema Information
#
# Table name: recipes
#
#  id                   :integer          not null, primary key
#  name                 :string
#  quantity             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Recipe < ApplicationRecord
  # Associations
  has_many :recipezations, dependent: :destroy
  has_many :products, through: :recipezations
	validates :name, presence: true, uniqueness: true
	validates :quantity, presence: true

	has_attached_file :picture, styles: { svg: "900x500>", large: "520x520>", medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
