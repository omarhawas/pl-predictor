class MiniLeagueUsersController < ApplicationController

    def create
        mini_league_user = MiniLeagueUser.new(mini_league_user_params)
        mini_league = MiniLeague.find(params[:mini_league_id])

        mini_league_user.mini_league_id = mini_league.id
        mini_league_user.user_id = current_user.id
        mini_league_user.is_admin = params[:is_admin]
        mini_league_user.points_earned = 0

        if mini_league_user.save
            render status: 200, json: {message: "Successfully create mini league user"}
        else
            render status: 400, json: {message: "Failed to create mini league user"}
        end
    end

    def update
        mini_league_user = MiniLeagueUser.find(params[:id])

        if mini_league_user.update(mini_league_user_params)
            render status: 200, json: {message: "Successfully updated mini league user"}
        else
            render status: 400, json: {message: "Failed to update mini league user"}
        end

    end

    def destroy
        mini_league_user = MiniLeagueUser.find(params[:id])

        if mini_league_user.destroy
            render status: 200, json: {message: "Successfully deleted mini league user"}
        else
            render status: 400, json: {message: "Failed to delete mini league user"}
        end

    end

    private

    def mini_league_user_params
        params.require(:mini_league_user).permit(:is_admin, :points_earned)
    end


end