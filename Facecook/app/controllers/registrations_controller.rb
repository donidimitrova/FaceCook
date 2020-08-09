class RegistrationsController < Devise::RegistrationsController
  def create
    #build the resource
    build_resource(sign_up_params)   
    #Verifying Captcha
    if verify_recaptcha(model: resource) 
      super
    else
      render 'new'
    end
    end
  protected
  
    def update_resource(resource, params)
      # Require current password if user is trying to change password.
      return super if params["password"]&.present?
  
      # Allows user to update registration information without password.
      resource.update_without_password(params.except("current_password"))
    end

  end