class MatchPredictionsController < ApplicationController

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

    def index
        match_predictions = MatchPrediction.where(match_id: params[:match_id])

        if match_predictions.exists?
            render json: {match_predictions: match_predictions}, status: 200
        else
            render json: {'no match predictions found'}, status: 404
        end
    end

    def show
        begin
            match_prediction = MatchPrediction.find(params[:id])
            render json: {match_prediction: match_prediction}, status: 200
        rescue ActiveRecord::RecordNotFound
            render json: {"match prediction not found"}, status: 404
        end
    end


    def update
        match_prediction = MatchPrediction.find(params[:id])

        if match_prediction.update(match_prediction_params)
            render json: {match_prediction: match_prediction}, status: 200
        else
            render json: {errors: match_prediction.errors}, status: 400
        end

    end

    def destroy
        match_prediction = MatchPrediction.find(params[:id])
        
        if match_prediction.destroy
            render json: {message: 'Successfully deleted match prediction'}, status: 200
        else
            render json: {error: 'Unable to delete match prediction'}, status: 400
        end
    end

    private

    def match_prediction_params
        params.require(:match_prediction).permit(:away_team_goals, :home_team_goals)
    end

end