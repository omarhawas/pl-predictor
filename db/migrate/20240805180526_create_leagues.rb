class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.string :season_name
      t.integer :external_season_id
      t.string :best_player
      t.string :top_scorer
      t.string :golden_gloves
      t.string :young_best_player
      t.string :most_assists
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
