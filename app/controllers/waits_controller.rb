class WaitsController < ApplicationController
    def create
        receiver = User.find(params[:waiting_for_id])
        current_user.request_wait(receiver)
    
        # 다른 page에서도 follow 쓰려면
        # redirect_back(fallback_location: root_path)과 같이 변경
        # redirect_to controller: 'feeds', action: 'index'
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content, status: :ok
    end

end
