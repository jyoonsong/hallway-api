class UsersController < ApplicationController
      def index
        users = User.order("created_at DESC")
        render 
      end
    
      def create
        user = User.create(user_param)
        render json: user
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
    
      def user_param
        params.require(:user).permit(:first_name, :last_name, :email, :affilitation, :link)
      end
    
      def request_wait(waiting_for)
        Wait.create(user_id: self.id, waiting_for_id: waiting_for.id) # waited_by_id = user_id
      end
end
