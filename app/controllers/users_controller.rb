class UsersController < ApplicationController
      def index
        @waiting_for_users = current_user.waiters
        @waited_by_users = current_user.waitings

        render 'users/index.json.jbuilder'
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
