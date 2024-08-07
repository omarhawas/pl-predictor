class MiniLeague < ApplicationRecord
  belongs_to :league
  belongs_to :admin_user, class_name: 'User', foreign_key: :admin_user_id
  has_many :mini_league_users
  has_many :match_predictions
end
