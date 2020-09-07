class RegistrationsController < Devise::RegistrationsController
  def create
    if (params[:user][:username] == "")
      flash[:alert] = "Campo obbligatorio username lasciato in bianco"
      redirect_to  new_user_registration_path
      return
    end
    if ( params[:user][:name] == "" )
      flash[:alert] = "Campo obbligatorio nome lasciato in bianco"
      redirect_to  new_user_registration_path
      return
    end
    if ( params[:user][:cognome] == "" )
      flash[:alert] = "Campo obbligatorio cognome lasciato in bianco"
      redirect_to  new_user_registration_path
      return
    end
    if ( params[:user][:categoria] == "")
      flash[:alert] = "Campo obbligatorio categoria lasciato in bianco"
      redirect_to  new_user_registration_path
      return
    end
    #build the resource
    build_resource(sign_up_params)   
    #Verifying Captcha
    if verify_recaptcha(model: resource) 
      super
    else
      render 'new'
    end
    end
    def after_update_path_for(resource)
      flash[:notice] = "Account aggiornato"
      edit_user_registration_path
  end
  protected
  
    def update_resource(resource, params)
      # Require current password if user is trying to change password.
      return super if params["password"]&.present?
  
      # Allows user to update registration information without password.
      resource.update_without_password(params.except("current_password"))
    end

    private

    def sign_up_params
      
      params.require(:user).permit(:username, :name,:cognome, :email, :password, :password_confirmation,:categoria)
    end
  
    def account_update_params
      params.require(:user).permit(:username, :name,:cognome, :email, :password, :password_confirmation,:categoria, :descrizione)
    end


  end