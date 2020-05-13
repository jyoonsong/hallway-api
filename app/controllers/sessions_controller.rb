class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            login!
            print session[:user_id]
            render json: {
                logged_in: true,
                user: @user
            }
        else
            render json: {
                status: 401,
                errors: ["no such user", "verify credentials"]
            }
        end
    end

    def is_logged_in?
        if logged_in? && current_user
            render json: {
                logged_in: true,
                user: current_user
            }
        else
            render json: {
                logged_in: false,
                message: "no such user"
            }
        end
    end

    def destroy
        logout!
        render json: {
            status: 200,
            logged_in: false
        }
    end

    private

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end
end
