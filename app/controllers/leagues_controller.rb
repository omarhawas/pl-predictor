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
        
        current_season = FootballApi.get_current_season()

        if current_season
            league = League.where(external_season_id: current_season["id"]).first

            if !league.present?
                league = League.create(external_season_id: current_season["id"], season_name: Time.current.year.to_s, start_date: current_season["startDate"], end_date: current_season["endDate"])
            end

            
            db_teams = []

            teams = FootballApi.get_current_season_teams()

            if teams
                teams.each do |team|
                    db_team = LeagueTeam.where(external_id: team["id"]).first

                    if !db_team.present?
                        db_team = LeagueTeam.create(league_id: league.id, name: team["name"], external_id: team["id"], crest: team["crest"])
                    end

                    db_teams.push(db_team)
                end
            else
                render status: 400, json: {message: "Failed to sync teams"}
            end

           render status: 200, json: {league: league, teams: db_teams}
        else
            render status: 400, json: {message: "Unable to sync"}
        end

    end


    private

    def league_params
        params.require(:league).permit(:season_name, :start_date, :end_date)
    end
end 