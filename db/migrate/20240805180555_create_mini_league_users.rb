class CreateMiniLeagueUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :mini_league_users do |t|
      t.references :mini_league, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :is_admin
      t.integer :points_earned

      t.timestamps
    end
  end
end
