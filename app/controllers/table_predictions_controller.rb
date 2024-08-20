class TablePredictionsController < ApplicationController

    def create
        league = League.find(params[:league_id])
        table_prediction = TablePrediction.new(table_prediction_params)

        table_prediction.league_id = league.id
        table_prediction.user_id = current_user.id

        if table_prediction.save
            render status: 200, json: {table_prediction: table_prediction, message: "Successfully created table prediction"}
        else
            render status: 400, json: {message: "Unable to create table prediction"}
        end
    end

    def update
        table_prediction = TablePrediction.find(params[:id])

        if table_prediction.update(table_prediction_params)
            render status: 200, json: {message: "Successfully updated table prediction", table_prediction: table_prediction}
        else
            render status: 400, json: {message: "Unable to update table prediction"}
        end
    end

    def index
        table_predictions = TablePrediction.where(user_id: current_user.id)

        if table_predictions.exists?
            render status: 200, json: {table_prediction: table_predictions}
        else
            render status: 400, json: {message: "No table predictions found"}
        end
    end

    def destroy
        table_prediction = TablePrediction.find(params[:id])

        if table_prediction.destroy
            render status: 200, json: {message: "Successfully deleted table prediction"}
        else
            render status: 400, json: {message: "Unable to delete table prediction"}
        end

    end

    def get_user_table_predictions_for_league
        league = League.find(params[:league_id])
        user_table_predictions = TablePrediction.where(user_id: current_user.id, league_id: league.id)

        if user_table_predictions.exists?
            status: 200, json: {message: "Successfully retrieved user table predictions", user_table_predictions: user_table_predictions}
        else
            status: 404, json: {message: "No user table predictions found"}
        end
    end

    private

    def table_prediction_params
        params.require(:table_prediction).permit(:rank, :league_team_id)
    end
end