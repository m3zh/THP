class Superuser::BaseController < ApplicationController
    before_action :check_if_superuser

    private

    def check_if_superuser
        authenticate_user!

        if !current_user.superuser
            flash[:danger] = "Accès refusé"
            redirect_to root_path
        end
    end
end
