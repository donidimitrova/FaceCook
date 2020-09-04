class UsersController < ApplicationController
		before_action :authenticate_user!
	
	def classifica
		@cuochi=User.where(:categoria => '1')
		@cuochi.each do |cuoco|
		 @recipes = cuoco.recipes
		 @numeroricette=@recipes.count
		 @media=0

		 	
		end	 
	end			
		
	def update
		
  		@user = User.find(params[:id])
		@user.update(att: params[:user][:att], def: params[:user][:def], arm: params[:user][:arm])
		  
	end
end
