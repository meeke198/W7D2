class UsersController < ApplicationController
    #for user to signup
    before_action :require_logged_out, only: [:index, :show]
    def new
        @user = User.new
        render :new 
    end

    def show
        @user = User.find(params[:id])
        render :show 
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
    def user_params
        params.require(:user).permit(:email, :password)
    end
end