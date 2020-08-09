class ProfileController < ApplicationController

    before_action :authenticate_user!

    def show

        id = params[:id]
        @user= User.find(id)
        @var = @user.id

    end



	def update
  		@user = User.find(params[:id])
  		@user.update(categoria: params[:user][:categoria], avatar: params[:user][:avatar])
        redirect_to root_path 
        
        
	end

    

end
