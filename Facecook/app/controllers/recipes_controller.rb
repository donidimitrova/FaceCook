class RecipesController < ApplicationController
load_and_authorize_resource
skip_authorize_resource :only => [:show, :ricette]
before_action :find_recipe, only: [:show, :edit, :update, :destroy]
skip_before_action :verify_authenticity_token

	
        def index
              # authorize! :manage, Recipe
		@recipes =Recipe.all.order("created_at DESC")
	end

	def new
             #   authorize! :manage, Recipe
		@recipe = current_user.recipes.build
                @categories=Category.all.map{ |c| [c.name, c.id] }
        end

	def create
             #   authorize! :manage, Recipe
		@recipe = current_user.recipes.build(recipe_params)
                @recipe.category_id = params[:category_id] 
                @recipe.save
                flash[:success] = "La ricetta è stata inserita!"
	        redirect_to ricette_path
        end

	def update
         #authorize! :manage, Recipe
         @recipe.category_id = params[:category_id]
         if @recipe.update(recipe_params)
          redirect_to recipe_path(@recipe)
          flash[:success] = 'Ricetta modificata!'
         else
          render 'edit'
         end
	end

	def show
		if @recipe.reviews.blank?
			@average_review=0
		else
			@average_review=@recipe.reviews.average(:rating).round(1)
		end
	end
	
        def edit 
            #authorize! :manage, Recipe, user_id: user.id
            @categories=Category.all.map{ |c| [c.name, c.id] }        
        end
	
        def destroy
         #authorize! :manage, Recipe
         @category_name=Category.find_by(id: @recipe.category_id)
         @recipe.destroy
	 redirect_to ricette_path(category: @category_name.name)
         flash[:success] = 'Ricetta eliminata!'
	end
        
        def ricette
          if params[:category].blank?
	   @recipes =Recipe.all.order("created_at DESC")
          else
           @category_id=Category.find_by(name: params[:category])
           @recipes=Recipe.where(:category_id => @category_id).order("created_at DESC")
          end  
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
