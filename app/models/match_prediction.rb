class MatchPrediction < ApplicationRecord
  belongs_to :match
  belongs_to :user
  belongs_to :league
end
