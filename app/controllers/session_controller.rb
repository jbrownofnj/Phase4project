class SessionController < ApplicationController
    before_action :authorize_user, except: [:login]

    def login

        user = User.find_by(user_name:params[:username])
        
        if user&.authenticate(params[:password])
            
            session[:current_user] = user.id
            session[:login_attempts] = 0
            render json: user, status: :ok
        else
            session[:login_attempts] ||= 0
            session[:login_attempts] += 1
            render json: { error: "Bad username or password" },  status: :unauthorized
        end

    end 

    def logout
        session.delete :current_user
    end 
end
