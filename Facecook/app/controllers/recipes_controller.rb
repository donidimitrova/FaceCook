class RecipesController < ApplicationController
skip_before_action :verify_authenticity_token
load_and_authorize_resource
	
        def index
		@recipe =Recipe.all
	end

	def new
		@recipe = current_user.recipes.build
                @categories=Category.all.map{ |c| [c.name, c.id] }
        end

	def create
		@recipe = current_user.recipes.build(recipe_params)
                @recipe.category_id = params[:category_id] 

    if @recipe.save
      flash[:success] = "La ricetta è stata inserita!"
      redirect_to recipes_path
	end
		
	end

	def update
        id = params[:id]
        @recipe = Recipe.find(id)
        @recipe.update_attributes!(params[:recipe].permit(:nome,:categoria,:immagine,:descrizione,:link))
		redirect_to recipes_path(@recipe)
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

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_recipe
	  @recipe = Recipe.find(params[:id])
	end
	
	# Never trust parameters from the scary internet, only allow the white list through.
	def recipe_params
	  params.require(:recipe).permit(:nome,:categoria,:immagine, :descrizione, :link,:category_id)
	end
end
