class UsersController < ApplicationController
    before_action :require_user, except: [:new, :create]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(create_user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/' 
        else
            render 'new'
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
        if @user.update_attributes(update_user_params) 
            redirect_to '/profile' 
        else
            puts @user.errors.full_messages
            render 'edit'
        end
    end
    
    private
    def create_user_params
        params.require(:user).permit(:user_name, :full_name, :email, :password)
    end
    def update_user_params
        params.require(:user).permit(:full_name, :email)
    end
end
