class Superuser::UsersController < Superuser::BaseController
    before_action :check_if_superuser


end
