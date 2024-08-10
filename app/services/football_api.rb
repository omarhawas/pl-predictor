class FootballApi

    def self.get_current_season

        football_org_token = Rails.application.credentials.dig(:football_data_api)

        uri = URI.parse("http://api.football-data.org/v4/competitions/PL")
        request = Net::HTTP::Get.new(uri)
        request["X-Auth-Token"] = Rails.application.credentials.dig(:football_data_api)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
            http.request(request)
        end

        if response.is_a?(Net::HTTPSuccess)
            data = JSON.parse(response.body)
            return data["currentSeason"]
        else
            return nil
        end
    end

    def self.get_current_season_teams

        football_org_token = Rails.application.credentials.dig(:football_data_api)

        uri = URI.parse("http://api.football-data.org/v4/competitions/PL/teams?season=#{Time.current.year}")
        request = Net::HTTP::Get.new(uri)
        request["X-Auth-Token"] = football_org_token

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
            http.request(request)
        end

        if response.is_a?(Net::HTTPSuccess)
            data = JSON.parse(response.body)
            teams = data["teams"]
            return teams
        else
            return nil
        end

    end

    def self.get_matches_for_next_three_weeks

        todays_date = Date.current.strftime("%Y-%m-%d")
        three_weeks_from_today = (Date.current + 21.days).strftime("%Y-%m-%d")

        football_org_token = Rails.application.credentials.dig(:football_data_api)

        uri = URI.parse("http://api.football-data.org/v4/competitions/PL/matches?dateFrom=#{todays_date}&dateTo=#{three_weeks_from_today}")
        request = Net::HTTP::Get.new(uri)
        request["X-Auth-Token"] = football_org_token

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
            http.request(request)
        end

        if response.is_a?(Net::HTTPSuccess)
            data = JSON.parse(response.body)
            matches = data["matches"]
            return matches
        else
            return nil
        end

    end


end