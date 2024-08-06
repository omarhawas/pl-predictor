class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :league, null: false, foreign_key: true
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_team_goals
      t.integer :away_team_goals
      t.datetime :start_time
      t.datetime :end_time
      t.integer :external_id

      t.timestamps
    end
  end
end
