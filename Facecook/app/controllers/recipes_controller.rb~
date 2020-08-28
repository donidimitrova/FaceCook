class RecipesController < ApplicationController
skip_before_action :verify_authenticity_token
	
        def index
		@recipes =Recipe.all
	end

	def create
		@recipe = Recipe.create!(params[:recipe].permit(:nome,:categoria,:immagine,:descrizione,:link))
		redirect_to recipes_path
		
	end

	def update
        id = params[:id]
        @recipe = Recipe.find(id)
        @recipe.update_attributes!(params[:recipe].permit(:nome,:categoria,:immagine,:descrizione,:link))
		redirect_to recipe_path(@recipe)
	end

	def show
        	id = params[:id]
        	if Recipe.exists?(id)
            		@recipe = Recipe.find(id)
        	else
         	render html: 'Recipe does not exit'
        	end
	end
	#def edit 
		
	#	id=params[:id]
	#	@recipe=Recipe.find(id)
	#	render html:'edit'
	#end
	def destroy
		id = params[:id]
		@recipe = Recipe.find(id)
		@recipe.destroy
		redirect_to recipes_path
	end
end
