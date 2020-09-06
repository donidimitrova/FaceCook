class UsersController < ApplicationController
		before_action :authenticate_user!
	
	def classifica
	     @cuochi=User.where(:categoria => '1') #prendo tutti i cuochi
		 @cuochi.each do |cuoco|               #per ogni cuoco
		  @recipes = cuoco.recipes            #prendo tutte le ricette
		  @numeroricette=@recipes.count       #prendo quante ricette ha il cuoco
		  @mediaricette=0                     #pongo la media di tutte le ricette =0
		  @recipes.each do |ricetta|          #per ogni ricetta dl cuoco
			@reviews=ricetta.reviews          #prendo tutte le review di ogni ricetta
			@numeroreview=@reviews.count      #prendo il numero di review di ogni ricetta
			@sommavotiricetta=0               #pongo somma dei voti di ogni ricetta =0
			@reviews.each do |review|         #per ogni review di una ricetta
			  @sommavotiricetta+=review.rating  #aggiungo in sommavotiricetta i voti di tutte le review 
			end
		  if @sommavotiricetta==0 || @numeroreview==0  #controllo se una dei due e` =0
			 @mediaricetta=0
		  else
			@mediaricetta=@sommavotiricetta/(@numeroreview+0.0)   #calcolo la media dei voti della ricetta, ho aggiunto 0.0 in modo da fare la divisione float
			@mediaricette+=@mediaricetta                          #sommo la media di una ricetta nella variabile che conterra` la somma di tutte le medie
		  end   
		 end
		if @mediaricette==0 || @numeroricette==0  #controllo se una dei due e` =0
			 @votocuoco=0
			 cuoco.update_attribute(:avg, @votocuoco)
		else 
		   @votocuoco=@mediaricette/(@numeroricette+0.0) #calcolo infine la media di tutte le medie
		   cuoco.update_attribute(:avg, @votocuoco)
		end
	 end
	  @cuochis=User.where(:categoria => '1').order("avg DESC")	  
	end			
		
	def update
		
  		@user = User.find(params[:id])
		@user.update(att: params[:user][:att], def: params[:user][:def], arm: params[:user][:arm])
		  
	end
end
