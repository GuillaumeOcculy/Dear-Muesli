class PagesController < ApplicationController

	def home
	end

	def my_account
		@user = User.new
	end
end