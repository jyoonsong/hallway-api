class ApplicationController < ActionController::API
    include ActionController::MimeResponds
    skip_before_action :verify_authenticity_token, raise: false
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!

    def login!
        session[:user_id] = @user.id
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized_user?
        @user == current_user
    end

    def logout!
        session.clear
    end
  
    # def set_user
    #   #FIXME the code below is for development only
    #   @user = User.find params[:current_user_id] rescue nil
    # end
  
    # def render_unauthorized
    #   render json: {}, status: :unauthorized
    # end
end
