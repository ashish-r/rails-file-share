class ApplicationController < ActionController::Base
    helper_method :current_user, :file_size_verbose

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def require_user 
        redirect_to '/login' unless current_user 
    end 
    
    def file_size_verbose(byte)
        @kb = byte / 1024
        if @kb < 1024
            return "#{@kb} KB"
        end
        @mb = @kb / 1024
        if @mb < 1024
            return "#{@mb} MB"
        end
        @gb = @mb / 1024
        return "#{@gb} GB"
    end
end
