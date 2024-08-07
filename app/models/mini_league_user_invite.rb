class MiniLeagueUserInvite < ApplicationRecord
  belongs_to :user
  belongs_to :mini_league
  belongs_to :invited_by_user, class: "User", foreign_key: :invited_by_user_id
end
