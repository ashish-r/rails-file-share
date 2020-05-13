class SessionsController < ApplicationController
    def new
        if session[:user_id]
            redirect_to '/' if User.find(session[:user_id])
        end
    end

    def create
        @user = User.find_by(user_name: params[:session][:user_name])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            render 'new'
        end 
    end

    def destroy
      session[:user_id] = nil 
      redirect_to '/login' 
    end
end
