class ApplicationController < ActionController::API
    protect_from_forgery with: :exception
    before_action :login_required

    helper_method :current_user
    helper_method :logged_in?

    def login_required
      if !logged_in?
          redirect_to new_session_path
          # render json: {}, status: :unauthorized
      end
    end

    def logged_in?
        !!current_user
    end


    def current_user
        if session[:user_id]
          @current_user = User.find(session[:user_id])
          @current_user
        else
          false
        end
    end
  
    # def set_user
    #   #FIXME the code below is for development only
    #   @user = User.find params[:current_user_id] rescue nil
    # end
  
    # def render_unauthorized
    #   render json: {}, status: :unauthorized
    # end
end
