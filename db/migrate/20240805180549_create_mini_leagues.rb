class CreateMiniLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :mini_leagues do |t|
      t.string :name
      t.references :league, null: false, foreign_key: true
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
