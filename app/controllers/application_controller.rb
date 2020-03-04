class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
        @current_user=User.find_by(id:session[:user_id])
    end

    def varify_user
        if session[:user_id]==nil
            redirect_to("/login")
        end
    end
end
