class MiniLeagueUserInvitesController < ApplicationController

    def create
        mini_league = MiniLeague.find(params[:mini_league_id])
        mini_league_user_invite = MiniLeagueUserInvite.new(mini_league_user_invite_params)

        mini_league_user_invite.user_id = current_user.id
        mini_league_user_invite.invited_by_user_id = 
        mini_league_user_invite.accepted_at = Time.now

        if mini_league_user_invite.save
            render json: {mini_league_user_invite: mini_league_user_invite}, status: 200
        else
            render json: {error: mini_league_user_invite.errors}, status: 400
        end
    end

    





    private

    def mini_league_user_invite_params
        params.require(:mini_league_user_invite).permit()
    end
end