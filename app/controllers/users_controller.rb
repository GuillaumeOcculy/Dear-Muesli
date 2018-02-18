class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  
  def show
    @billing_address = @user.billing_address
    @delivery_address = @user.delivery_address
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Informations modifiées'
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Informations non modifiées'
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_current_user(@user, true)
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
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end