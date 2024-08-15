class MiniLeaguesController < ApplicationController

    def create
        mini_league = MiniLeague.new(mini_league_params)
        league = League.find(params[:league_id])
        
        mini_league.league_id = league.id
        mini_league.admin_user_id = current_user.id

        if mini_league.save
            render status: 200, json: {message: "Successfully created mini league"}
        else
            render status: 400, json: {message: "Failed to create mini league"}
        end

    end

    def update
        mini_league = MiniLeague.find(params[:id])

        if mini_league.update(mini_league_params)
            render status: 200, json: {message: "Successfully updated mini league"}
        else
            render status: 400, json: {message: "Failed to update mini league"}
        end
    end

    def destroy
        mini_league = MiniLeague.find(params[:id])

        if mini_league.destroy
            render status: 200, json: {message: "Successfully deleted mini league"}
        else
            render status: 400, json: {message: "Failed to delete mini league"}
        end
    end

    private

    def mini_league_params 
        params.require(:mini_league).permit(:name)
    end
end