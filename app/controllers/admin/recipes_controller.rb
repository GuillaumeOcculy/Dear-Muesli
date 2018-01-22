module Admin
	class RecipesController < AdminController
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

		private
		def recipe_params
			params.require(:recipe).permit(:name, :quantity, :picture)
		end
	end
end