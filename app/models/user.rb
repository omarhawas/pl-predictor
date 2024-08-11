class User < ApplicationRecord
    has_many :mini_league_user_invites, foreign_key: :user_id, dependent: :destroy
    has_many :mini_league_users, foreign_key: :user_id, dependent: :destroy
    has_many :match_predictions, foreign_key: :user_id, dependent: :destroy
    has_many :league_predictions, foreign_key: :user_id, dependent: :destroy

    before_create :set_access_code

    validates :access_code, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :username, uniqueness: true

    def set_access_code
        self.access_code = rand(1000..9999).to_s
    end

end
