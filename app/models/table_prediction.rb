class TablePrediction < ApplicationRecord
  belongs_to :user
  belongs_to :league_team
  belongs_to :league
end
