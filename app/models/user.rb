# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  password_digest        :string
#  is_admin               :boolean          default(FALSE)
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  auth_token             :string
#  password_reset_token   :string
#  password_reset_sent_at :datetime
#

class User < ApplicationRecord
	has_secure_password

	before_create { generate_token(:auth_token) }

	# Associations
	has_many :orders
	has_many :addresses, as: :addressable, dependent: :destroy
	
	# Validations
	validates :email, 		presence: true, uniqueness: true
	validates :password, 	presence: true, on: :create
	validates_confirmation_of	:password

	def send_password_reset
		generate_token(:password_reset_token)
		update_attribute(:password_reset_sent_at, Time.zone.now)
		UserMailer.password_reset(self).deliver_later
	end

	def name
		[first_name, last_name].join(' ')
	end

	def billing_address
		addresses.billings.first
	end

	def delivery_address
		addresses.deliveries.first
	end

	def has_billing_address?
		!!billing_address
	end

	def has_delivery_address?
		!!delivery_address
	end

	private
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end
