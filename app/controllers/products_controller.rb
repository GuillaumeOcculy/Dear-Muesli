class ProductsController < ApplicationController
  
  def index
    @products = Product.joins(:recipes).uniq
  end

  def show
    @product = Product.find(params[:id])
    @recipes = @product.recipes
  end

  def destroy
    current_order.order_items.find_by(product_id: params[:id]).destroy

    flash[:success] = "Produit retiré"
    redirect_to cart_path(current_order)
  end
end