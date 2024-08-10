class League < ApplicationRecord
    has_many :matches, dependent: :destroy
    has_many :league_teams, dependent: :destroy
    has_many :mini_leagues, dependent: :destroy
    has_many :match_predictions, dependent: :destroy
    has_many :league_predictions, dependent: :destroy
end
