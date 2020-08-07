class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def set_current_user
        @current_user |= User.where(:id => session[:id])
    end
    def after_sign_in_path_for(current_user)
        if User.find(current_user.id).provider == "facebook" && User.find(current_user.id).categoria == nil
	        sceglicategoria_path

        else
            root_path
        end
    end

end
