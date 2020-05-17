class WaitsController < ApplicationController
    
    def create
        current_user.request_wait(params[:is_waited_id])
    
        # 다른 page에서도 follow 쓰려면
        # redirect_back(fallback_location: root_path)과 같이 변경
        # redirect_to controller: 'feeds', action: 'index'
        Log.create(
            kind: "request_wait",
            content: params[:is_waited_id].to_s,
            user_id: current_user.id
        )
    end

    def destroy
        wait = Wait.find_by(waiter_id: current_user.id, waiting_id: params[:is_waited_id])
        wait.destroy

        Log.create(
            kind: "cancel_wait",
            content: params[:is_waited_id].to_s,
            user_id: current_user.id
        )
    end

    def match
        is_waited_user = User.find(params[:is_waited_id])
        wait = Wait.find_by(waiter_id: is_waited_user.id, waiting_id: current_user.id)
        wait.destroy

        if (current_user.matches.length == 0 && is_waited_user.matches.length == 0)
            @match = Match.create(match_one_id: is_waited_user.id, match_two_id: current_user.id)
        end

        Log.create(
            kind: "start_talk",
            content: params[:is_waited_id].to_s,
            user_id: current_user.id
        )

        render 'matchs/match.json.jbuilder'

    end

    def unmatch
        Log.create(
            kind: "end_talk",
            content: params[:is_waited_id].to_s,
            user_id: current_user.id
        )
    end

end
