class MatchPredictionsController < ApplicationController

    def index

    end

    def show

    end

    def create
        match = Match.find(params[:match_id])
        league = match.league

        match_prediction = MatchPrediction.new(match_prediction_params)

        match_prediction.league_id = league.id
        match_prediction.match_id = match.id
        match_prediction.user_id = current_user.id

        if match_prediction.save
            render json: {match_prediction: match_prediction}, status: 200
        else 
            render json: {error: match_prediction.errors}, status: 400
        end

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def match_prediction_params
        params.require(:away_team_goals, :home_team_goals)
    end

end