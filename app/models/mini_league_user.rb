class MiniLeagueUser < ApplicationRecord
  belongs_to :mini_league
  belongs_to :user
end
