class MiniLeagueUser < ApplicationRecord
  belongs_to :mini_league, polymorphic: true
  belongs_to :user
end
