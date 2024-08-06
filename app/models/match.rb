class Match < ApplicationRecord
  belongs_to :league
  has_many :match_predictions, foreign_key: :match_id
end
