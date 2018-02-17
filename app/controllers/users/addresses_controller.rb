module Users
  class AddressesController < ApplicationController
    before_action :find_user
    before_action :find_address, only: [:edit, :update]

    def index
      @billing_address = @user.billing_address
      @delivery_address = @user.delivery_address
    end

    def new
      @address = @user.addresses.build
    end

    def create
      @address = @user.addresses.build(address_params)
      if @address.save
        flash[:success] = 'Addresse ajoutée'
        redirect_to user_addresses_path(@user)
      else
        flash[:danger] = 'Addresse non ajoutée'
        render :new
      end
    end 

    def edit
    end

    def update
      if @address.update!(address_params)
        flash[:success] = 'Addresse modifiée'
        redirect_to user_addresses_path(@user)
      else
        flash[:danger] = 'Addresse non modifiée'
        render :edit
      end
    end

    private
    def find_user
      @user = User.find(params[:user_id])
    end

    def find_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit!
    end
  end
end