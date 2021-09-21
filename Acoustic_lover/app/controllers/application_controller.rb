class ApplicationController < ActionController::Base

    # expose current_user with the views
    method_helper :current_user
    method_helper :logout!
    def require_logged_in!
        redirect_to new_session_url if current_user.nil?
    end

    def require_logged_out!
        redirect_to users_url if current_user.nil?
    end

    def current_user
        return nil if current_user.nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end


    def login!(current_user)
        session[:session_token] = user.session_token
    end


    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
    end

end
