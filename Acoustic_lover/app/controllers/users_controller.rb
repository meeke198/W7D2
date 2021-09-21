class UsersController < ApplicationController
    # before_action :require_logged_in, only: [:index, :show]
    def new
        @user = User.new
        render :new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            flash[:sucess] = ["Welcome new Acoustic lover!!! your account created sucessfully"]
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messeges, status: 401
        end
    end
    private
    params.require(:user).permit(:email, :password)
    
end