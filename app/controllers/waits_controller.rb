class WaitsController < ApplicationController
    
    def create
        receiver = User.find(params[:waiting_for_id])
        User.find(params[:user_id]).request_wait(receiver)
    
        # 다른 page에서도 follow 쓰려면
        # redirect_back(fallback_location: root_path)과 같이 변경
        # redirect_to controller: 'feeds', action: 'index'
    end

    def destroy
        wait = Wait.where(user_id: params[:user_id], waiting_for_id: params[:waiting_for_id])
        wait.destroy
    end

end
