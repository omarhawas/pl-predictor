class User < ApplicationRecord
    has_many :mini_league_user_invites, foreign_key: :user_id
    has_many :mini_league_users, foreign_key: :user_id
    has_many :match_predictions, foreign_key: :user_id
    has_many :league_predictions, foreign_key: :user_id

    before_create :set_access_code

    def set_access_code
        self.access_code = rand(1000..9999).to_s
    end
end
