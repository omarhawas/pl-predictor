class MiniLeagueUserInvite < ApplicationRecord
  belongs_to :user
  belongs_to :mini_league, foreign_key: :league_id
end
