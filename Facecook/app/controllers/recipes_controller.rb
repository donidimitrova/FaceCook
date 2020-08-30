class RecipesController < ApplicationController
before_action :find_recipe, only: [:show, :edit, :update, :destroy]
skip_before_action :verify_authenticity_token
load_and_authorize_resource
	
        def index
		@recipe =Recipe.all.order("created_at DESC")
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
         @recipe.category_id = params[:category_id]
         if @recipe.update(recipe_params)
          redirect_to recipe_path(@recipe)
         else
          render 'edit'
         end
	end

	def show
        #	id = params[:id]
        #	if Recipe.exists?(id)
         #   		@recipe = Recipe.find(id)
        #	else
         #	render html: 'Recipe does not exit'
        #	end
	end
	
        def edit 
            @categories=Category.all.map{ |c| [c.name, c.id] }        
        end
	
        def destroy
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
       
        def find_recipe
          @recipe=Recipe.find(params[:id])
        end
end
