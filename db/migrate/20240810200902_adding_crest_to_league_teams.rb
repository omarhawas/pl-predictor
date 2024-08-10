class AddingCrestToLeagueTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :league_teams, :crest, :string

  end
end
