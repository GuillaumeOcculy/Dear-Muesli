module Admin
	class RecipesController < AdminController
		before_action	:find_recipe, only: [:show, :edit, :update]

		def index
			@recipes = Recipe.all
		end

		def new
			@recipe = Recipe.new
		end

		def create
			@recipe = Recipe.new(recipe_params)
			if @recipe.save
				flash[:success] = 'Ingredient ajouté'
				redirect_to admin_recipes_path
			else
				flash.now[:danger] = 'Ingredient non ajouté'
				render :new
			end
		end

		def edit
		end

		def update
			if @recipe.update(recipe_params)
				flash[:success] = 'Ingredient modifié'
				redirect_to admin_recipes_path
			else
				flash.now[:danger] = 'Ingredient non modifié'
				render :edit
			end
		end

		private
		def recipe_params
			params.require(:recipe).permit(:name, :quantity, :picture)
		end

		def find_recipe
			@recipe = Recipe.find(params[:id])
		end
	end
end