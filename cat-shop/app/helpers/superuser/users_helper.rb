module Superuser::UsersHelper
    
    def check_if_superuser(user)
        authenticate_user!
        
        if !current_user.superuser
            flash[:danger] = "Accès refusé"
            redirect_to root_path      
        end

    end
      
      
end
