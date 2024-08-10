class MatchesController < ApplicationController

    skip_before_action :authorize_user, only: [:sync_matches]

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

    def sync_matches
        league = League.find(params[:league_id])
        matches = FootballApi.get_matches_for_next_three_weeks()

        db_matches = []

        if matches.present?
            
            matches.each do |match|
                db_match = Match.where(external_id: match["id"]).first
                if !db_match.present?
                    db_home_team_id = LeagueTeam.where(external_id: match["homeTeam"]["id"]).first.id
                    db_away_team_id = LeagueTeam.where(external_id: match["awayTeam"]["id"]).first.id
                    start_date = DateTime.parse(match["utcDate"])
                    end_date = start_date + 3.hours
                    db_match = Match.create(league_id: league.id, home_team_id: db_home_team_id, away_team_id: db_away_team_id, start_time: start_date, end_time: end_date)
                end
                db_matches.push(db_match)
            end
            render status: 200, json: {matches: db_matches}
        
        else
            render status: 400, json: {message: "Unable to sync matches"}
        end
    end


    private

    def match_params
        params.require(:match).permit(:home_team_goals, :away_team_goals, :start_time, :end_time)
    end
end