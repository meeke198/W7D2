class SessionsController < ApplicationController
    #for user to login and logout
    # before_action :require_logged_in![:destroy]
    # before_action :require_logged_out![:create, :new]

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    def destroy

    end
end