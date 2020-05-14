class WaitsController < ApplicationController
    
    def create
        current_user.request_wait(params[:is_waited_id])
    
        # 다른 page에서도 follow 쓰려면
        # redirect_back(fallback_location: root_path)과 같이 변경
        # redirect_to controller: 'feeds', action: 'index'
    end

    def destroy
        wait = Wait.find_by(waiter_id: current_user.id, waiting_id: params[:is_waited_id])
        wait.destroy
    end

end
