class Match < ApplicationRecord
  belongs_to :league
  has_many :match_predictions
  belongs_to :home_team, class_name: "LeagueTeam"
  belongs_to :away_team, class_name: "LeagueTeam"
end
