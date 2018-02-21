class CartsController < ApplicationController
  def show
  end

  def create
    cart_service = CartService.new(order: current_order, user: current_user, params: params)
    if cart_service.add_to_cart
      flash[:success] = "Ajouté au panier"
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "Non ajouté au panier"
      redirect_back fallback_location: root_path
    end
  end

  def finalize
    current_order
  end

  def checkout
    cart_service = CartService.new(order: current_order, user: current_user, params: order_params)
    if cart_service.checkout
      flash[:success] = "Panier checkouté"
      cookies.delete :order_id
      redirect_to root_path
    else
      render :finalize
    end
  end

  private
  def current_order
    if cookies.permanent[:order_id]
      @current_order ||= Order.find(cookies.permanent[:order_id]) if cookies.permanent[:order_id]
    else
      @current_order ||= Order.create
      cookies.permanent[:order_id] = @current_order.id
      @current_order
    end
  end

  def order_params
    params.require(:order).permit!
  end
end