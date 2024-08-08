class MiniLeaguesController < ApplicationController

    def create

        league = League.find(params[:league_id])
        mini_league = MiniLeague.new(mini_league_params)

    end

    private

    def mini_league_params 
        params.require(:mini_league).permit(:name)
    end



end