class CreateMatchPredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :match_predictions do |t|
      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.integer :away_team_goals
      t.integer :home_team_goals
      t.boolean :is_locked
      t.integer :points_earned

      t.timestamps
    end
  end
end
