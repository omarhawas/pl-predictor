class MiniLeagueUser < ApplicationRecord
  belongs_to :mini_league, foreign_key: :league_id, polymorphic: true
  belongs_to :user
end
