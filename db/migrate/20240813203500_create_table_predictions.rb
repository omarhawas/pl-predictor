class CreateTablePredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :table_predictions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :league_team, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.integer :rank

      t.timestamps
    end
  end
end
