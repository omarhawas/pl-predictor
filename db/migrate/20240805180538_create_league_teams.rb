class CreateLeagueTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :league_teams do |t|
      t.references :league, null: false, foreign_key: true
      t.string :name
      t.integer :current_rank
      t.integer :external_id
      t.integer :goals_scored
      t.integer :goals_conceded

      t.timestamps
    end
  end
end
