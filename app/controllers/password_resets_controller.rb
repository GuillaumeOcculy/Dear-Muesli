class PasswordResetsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user 
      flash[:success] = 'L’e-mail de réinitialisation du mot de passe a été envoyé.'
      user.send_password_reset 
      redirect_to success_password_resets_path
    else
      flash.now[:danger] = 'User not found'
      render :new
    end
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    if @user && (params[:user][:password] == params[:user][:password_confirmation])
      @user.update(user_params)
      set_current_user(@user, true)
      redirect_to @user
    elsif @user && params[:user][:password] != params[:user][:password_confirmation] 
      flash.now[:danger] = 'Les mots de passe ne correspondent pas.'
      render :edit
    else
      flash.now[:danger] = 'Non'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:password)
  end
end