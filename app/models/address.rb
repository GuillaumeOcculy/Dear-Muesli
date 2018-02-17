# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_type :string
#  addressable_id   :integer
#  category         :string           default("billing")
#  first_name       :string
#  last_name        :string
#  entreprise_name  :string
#  email            :string
#  phone            :string
#  street_name      :string
#  street_name_2    :string
#  postal_code      :string
#  city             :string
#  country          :string           default("France")
#  note             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  scope :billings,   ->  { where(category: 'billing')  }
  scope :deliveries,  ->  { where(category: 'delivery') }

  def billing?
    category == 'billing'
  end

  def delivery?
    !billing?
  end
end
