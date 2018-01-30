class User < ApplicationRecord
	has_secure_password

	before_create { generate_token(:auth_token) }

	# Associations
	has_many :orders
	
	# Validations
	validates :email, 		presence: true, uniqueness: true
	validates :password, 	presence: true
	validates_confirmation_of	:password

	def send_password_reset
		generate_token(:password_reset_token)
		update_attribute(:password_reset_sent_at, Time.zone.now)
		UserMailer.password_reset(self).deliver_later
	end

	private
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end
