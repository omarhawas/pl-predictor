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

    end

    def index

    end

    def show

    end

    def destroy

    end

    private

    def table_prediction_params
        params.require(:table_prediction).permit(:rank, :league_team_id)
    end
end