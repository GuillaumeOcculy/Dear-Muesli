class UsersController < ApplicationController
	before_action	:find_user, only: [:show]
	
	def show
	end

	def create
		@user = User.new(user_params)
		if @user.save
			set_current_user(@user)
			redirect_to @user
		else
			render 'pages/my_account'
		end
	end

	private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password)
	end
end