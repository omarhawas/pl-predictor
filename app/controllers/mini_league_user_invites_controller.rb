class MiniLeagueUserInvitesController < ApplicationController

    def create
        mini_league = MiniLeague.find(params[:mini_league_id])
        mini_league_user_invite = MiniLeagueUserInvite.new(mini_league_user_invite_params)

        user_email_invited = params[:email]
        invited_user = User.where(email: user_email_invited).first

        if invited_user.present?
            mini_league_user_invite.user_id = invited_user.id
            mini_league_user_invite.invited_by_user_id = current_user.id
            mini_league_user_invite.mini_league_id = mini_league.id
        else
            status: 404, json: {message: "User not found"}
            return
        end

        if mini_league_user_invite.save
            render json: {mini_league_user_invite: mini_league_user_invite}, status: 200
        else
            render json: {error: mini_league_user_invite.errors}, status: 400
        end
    end

    def update
        mini_league_user_invite = MiniLeagueUserInvite.find(params[:id])

        if mini_league_user_invite.update(mini_league_user_invite_params)
            render status: 200, json: {message: "Successfully updated mini league user invite"}
        else
            render status: 400, json: {message: "Failed to update mini league user invite"}
        end
    end

    def index
        mini_league_user_invite = MiniLeagueUserInvite.find(params[:id])

        if mini_league_user_invite.exists?
            render status: 200, json: {mini_league_user_invite: mini_league_user_invite}
        else
            render status: 400, json: {message: "No mini league user invite exists"}
        end
    end

    private

    def mini_league_user_invite_params
        params.require(:mini_league_user_invite).permit(:email)
    end
end