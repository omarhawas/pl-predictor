class League < ApplicationRecord
    has_many :matches, foreign_key: :league_id
    has_many :league_teams, foreign_key: :league_id
    has_many :mini_leagues, foreign_key: :league_id
    has_many :match_predictions, foreign_key: :league_id
    has_many :league_predictions, foreign_key: :league_id
end
