class WaitsController < ApplicationController
    
    def create
        current_user.request_wait(receiver)
    
        # 다른 page에서도 follow 쓰려면
        # redirect_back(fallback_location: root_path)과 같이 변경
        # redirect_to controller: 'feeds', action: 'index'
    end

    def destroy
        current_user.cancel_wait(params[:is_waited_id])
    end

end
