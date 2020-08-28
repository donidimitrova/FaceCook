class RecipesController < ApplicationController
skip_before_action :verify_authenticity_token
	
        def index
		@recipe =Recipe.all
	end

	def new
		@recipe = Recipe.new
	  end

	def create
		@recipe = Recipe.create!(params[:recipe].permit(:nome,:categoria,:immagine,:descrizione,:link))

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
	  params.require(:recipe).permit(:nome,:categoria,:immagine, :descrizione, :link)
	end
end
