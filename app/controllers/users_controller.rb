class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

    def index
      @users = User.all
      @waiting_for_users = current_user.waiters

      render 'users/index.json.jbuilder'
    end

    def show
      user = User.find(params[:user_id])
      @waited_by_users = user.waitings
      render 'users/show.json.jbuilder'
    end

    def waited_by_users
      @waited_by_users = current_user.waitings
      @waiting_for_users = current_user.waiters
      render 'users/waited_by_users.json.jbuilder'
    end
  
    def create
      @user = User.new(user_param)
      if @user.save
        login!
        render json: {
          status: :created,
          user: @user
        }
      else 
        render json: {
          status: 500,
          errors: @user.errors.full_messages
        }
      end
    end
  
    def update
      user = User.find(params[:id])
      user.update_attributes(user_param)
      render json: user
    end
  
    def destroy
      user = User.find(params[:id])
      user.destroy
      head :no_content, status: :ok
    end

    private
  
    def user_param
      params.require(:user).permit(:first_name, :last_name, :email, :affilitation, :link, :password)
    end
end
