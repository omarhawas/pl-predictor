class User < ApplicationRecord
    has_many :mini_league_user_invites
    has_many :mini_league_users
    has_many :match_predictions
    has_many :league_predictions
end
