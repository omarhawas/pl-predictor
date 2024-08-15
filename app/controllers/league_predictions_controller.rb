class LeaguePredictionsController < ApplicationController

    def create
        league = League.find(params[:league_id])

        league_prediction = LeaguePrediction.new(league_prediction_params)

        league_prediction.user_id = current_user.id
        league_prediction.league_id = league.id

        if league_prediction.save
            render json: {league_prediction: league_prediction}, status: 200
        else 
            render json: {error: league_prediction.errors}, status: 400
        end
    end

    def index
        league_predictions = LeaguePrediction.where(league_id: params[:league_id])

        if league_predictions.exists?
            render json: {league_predictions: league_predictions}, status: 200
        else
            render json: {error: 'league predictions not found'}, status: 404
        end
    end

    def show
        begin
            league_prediction = LeaguePrediction.find(params[:id])
            render json: {league_prediction: league_prediction}, status: 200
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'league prediction not found'}, status: 404
        end
    end

    def update
        league_prediction = LeaguePrediction.find(params[:id])

        if league_prediction.update(league_prediction_params)
            render json: {league_prediction: league_prediction}, status: 200
        else 
            render json: {league_prediction: league_prediction}, status: 400
        end
    end

    def destroy
        league_prediction = LeaguePrediction.find(params[:id])

        if league_prediction.destroy
            render json: {message: 'Successfully deleted league prediction'}, status: 200
        else
            render json: {error: 'Unable to delete league prediction'}, status: 400
        end
    end

    private

    def league_prediction_params
        params.require(:league_prediction).permit(:best_player, :best_young_player, :golden_gloves, :top_scorer, :most_assists)
    end

end