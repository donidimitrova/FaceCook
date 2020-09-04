class ReviewsController < ApplicationController
load_and_authorize_resource
	before_action :find_recipe
	before_action :find_review, only: [:edit, :update, :destroy]
	

	def new
		@review = Review.new
        @review = Review.where(user_id: current_user.id, recipe_id: params[:recipe_id]).first_or_initialize
        if @review.id.present? 
            redirect_to recipe_path(@recipe)
            flash[:error]="Voto già inserito per questa ricetta!"
        end
	end

	def create
		@review = Review.new(review_params)
		@review.recipe_id = @recipe.id
		@review.user_id = current_user.id
		if @review.save
			redirect_to recipe_path(@recipe)
			flash[:success]="Voto inserito correttamente!"
		else
			render 'new'
		end
	end
        
  	private
		def review_params
			params.require(:review).permit(:rating)
		end

		def find_recipe
			@recipe = Recipe.find(params[:recipe_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

end
