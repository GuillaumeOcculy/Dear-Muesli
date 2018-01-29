class ProductsController < ApplicationController
  def index
    @products = Product.joins(:recipes).uniq
  end

  def show
    @product = Product.find(params[:id])
    @recipes = @product.recipes
  end
end