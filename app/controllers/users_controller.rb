class UsersController < ApplicationController
    before_action :require_user, except: [:new, :create]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/' 
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update(user_params) 
            @profile_updated = true
            render :show
        else
            render :edit
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:user_name, :full_name, :email, :password)
    end
end
