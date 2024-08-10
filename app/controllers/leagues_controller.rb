require 'net/http'
require 'uri'
require 'json'

class LeaguesController < ApplicationController

    skip_before_action :authorize_user, only: [:sync_leagues]


    def create
        league = League.new(league_params)

        # external_season_id = league.

        if league.save
            render json: {league: league}, status: 200
        else 
            render status: 400
        end

    end

    def sync_leagues
        football_org_token = Rails.application.credentials.dig(:football_data_api)

        uri = URI.parse("http://api.football-data.org/v4/competitions/PL")
        request = Net::HTTP::Get.new(uri)
        request["X-Auth-Token"] = football_org_token

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
            http.request(request)
        end

        if response.is_a?(Net::HTTPSuccess)
            data = JSON.parse(response.body)
            current_season = data["currentSeason"]
            league = League.where(external_season_id: current_season["id"]).first

            if !league.present?
                league = League.create(external_season_id: current_season["id"], season_name: Time.current.year.to_s, start_date: current_season["startDate"], end_date: current_season["endDate"])
            end

           render status: 200, json: {league: league}
        else
            render status: 400, json: {message: "Unable to sync"}
        end

    end


    private

    def league_params
        params.require(:league).permit(:season_name, :start_date, :end_date)
    end
end 