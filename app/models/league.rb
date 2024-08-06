class League < ApplicationRecord
    has_many :matches
    has_many :league_teams
    has_many :mini_leagues
    has_many :match_predictions
    has_many :league_predictions
end
