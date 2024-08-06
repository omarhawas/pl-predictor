class MiniLeagueUserInvite < ApplicationRecord
  belongs_to :user
  belongs_to :mini_league, polymorphic: true
end
