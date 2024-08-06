class CreateLeaguePredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :league_predictions do |t|
      t.references :league, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :best_player
      t.string :best_young_player
      t.string :golden_gloves
      t.string :top_scorer
      t.string :most_assists

      t.timestamps
    end
  end
end
