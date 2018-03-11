module Admin
  class ProductsController < AdminController
    before_action :find_product, only: [:show, :edit, :update]

    def index
      @products = Product.all
    end

    def show
      @recipes = @product.recipes
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        flash[:success] = 'Produit ajouté'
        redirect_to admin_products_path
      else
        flash.now[:danger] = 'Produit non ajouté'
        render :new
      end
    end

    def edit
      @recipezations = @product.recipezations
    end

    def update
      if @product.update(product_params)
        flash[:success] = 'Produit modifié'
        redirect_to admin_products_path
      else
        flash.now[:danger] = 'Produit non modifié'
        render :edit
      end
    end

    private
    def product_params
      params.require(:product).permit(:name, :description, :price, recipezations_attributes: [:id, :quantity, :recipe_id, :_destroy])
    end

    def find_product
      @product = Product.find(params[:id])
    end
  end
end