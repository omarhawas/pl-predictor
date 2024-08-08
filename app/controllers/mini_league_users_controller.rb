class MiniLeagueUsersController < ApplicationController

    def create
        mini_league = MiniLeague.find(params[:mini_league_id])
        mini_league_user_invite = MiniLeagueUserInvite.new(mini_league_user_invite_params)

        mini_league_user_invite.user_id = mini_league_user_invite.id
    end





    private

    def mini_league_user_invite_params
        params.require(:mini_league_user_invite).permit()
    end
end