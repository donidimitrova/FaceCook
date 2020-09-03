class ReviewsController < ApplicationController
	before_action :find_recipe
	before_action :find_review, only: [:edit, :update, :destroy]
	

	def new
		@review = Review.new
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
