class LeaguesController < ApplicationController

    def create
        league = League.new(league_params)

        # external_season_id = league.

        if league.save
            render json: {league: league}, status: 200
        else 
            render status: 400
        end

    end


    private

    def league_params
        params.require(:league).permit(:season_name, :start_date, :end_date)
    end
end 