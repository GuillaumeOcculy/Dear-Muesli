class SessionsController < ApplicationController
	def create
		if @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
			set_current_user(@user, params[:remember_me])
			redirect_to @user
		else
			render 'pages/my_account'
		end
	end

	def destroy
		cookies[:auth_token] = nil
		redirect_to root_path
	end
end