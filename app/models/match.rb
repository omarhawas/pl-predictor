class Match < ApplicationRecord
  belongs_to :league
  has_many :match_predictions
  belongs_to :home_team, class_name: "LeagueTeam"
  belongs_to :away_team, class_name: "LeagueTeam"

  def calculate_points
    self.match_predictions.each do |match_prediction|
      if match_prediction.home_team_goals == self.home_team_goals && match_prediction.away_team_goals == self.away_team_goals
          match_prediction.update(points_earned: 3)
      elsif match_prediction.home_team_goals - match_prediction.away_team_goals == self.home_team_goals - self.away_team_goals
          match_prediction.update(points_earned: 2)
      elsif (match_prediction.home_team_goals > match_prediction.away_team_goals && self.home_team_goals > self.away_team_goals) || 
          (match_prediction.home_team_goals < match_prediction.away_team_goals && self.home_team_goals < self.away_team_goals)
          match_prediction.update(points_earned: 1)
      else
          match_prediction.update(points_earned: 0)
      end
      match_prediction.save!
    end
  end

  def match_predictions_for_user(user)
    self.match_predictions.where(user_id: user.id)
  end
  
end
