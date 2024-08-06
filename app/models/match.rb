class Match < ApplicationRecord
  belongs_to :league
  has_many :match_predictions
end
