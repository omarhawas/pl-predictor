class AddLeagueCodeToMiniLeague < ActiveRecord::Migration[7.0]
  def change
    add_column :mini_leagues, :league_code, :string
  end
end
