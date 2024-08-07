class MatchesController < ApplicationController

    def create

        league = League.find(params[:league_id])
        match = Match.new(match_params)

        match.league_id = league.id

        if match.save
            render json: {match: match}, status: 200
        else 
            render status: 400
        end
    end


    private

    def match_params
        params.require(:match).permit(:home_team_goals, :away_team_goals, :start_time, :end_time)
    end


end