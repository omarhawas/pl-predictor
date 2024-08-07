class CreateMiniLeagueUserInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :mini_league_user_invites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mini_league, null: false
      t.integer :invited_by_user_id
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
