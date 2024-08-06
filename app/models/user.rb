class User < ApplicationRecord
    has_many :mini_league_user_invites, foreign_key: :user_id
    has_many :mini_league_users, foreign_key: :user_id
    has_many :match_predictions, foreign_key: :user_id
    has_many :league_predictions, foreign_key: :user_id
end
