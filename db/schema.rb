# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_08_05_180606) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "league_predictions", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "user_id", null: false
    t.string "best_player"
    t.string "best_young_player"
    t.string "golden_gloves"
    t.string "top_scorer"
    t.string "most_assists"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_predictions_on_league_id"
    t.index ["user_id"], name: "index_league_predictions_on_user_id"
  end

  create_table "league_teams", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.string "name"
    t.integer "current_rank"
    t.integer "external_id"
    t.integer "goals_scored"
    t.integer "goals_conceded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_teams_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "season_name"
    t.integer "external_season_id"
    t.string "best_player"
    t.string "top_scorer"
    t.string "golden_gloves"
    t.string "young_best_player"
    t.string "most_assists"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_predictions", force: :cascade do |t|
    t.bigint "mini_league_id", null: false
    t.bigint "match_id", null: false
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.integer "away_team_goals"
    t.integer "home_team_goals"
    t.boolean "is_locked"
    t.integer "points_earned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_match_predictions_on_league_id"
    t.index ["match_id"], name: "index_match_predictions_on_match_id"
    t.index ["mini_league_id"], name: "index_match_predictions_on_mini_league_id"
    t.index ["user_id"], name: "index_match_predictions_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_team_goals"
    t.integer "away_team_goals"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "external_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_matches_on_league_id"
  end

  create_table "mini_league_user_invites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "mini_league_type", null: false
    t.bigint "mini_league_id", null: false
    t.integer "invited_by_user_id"
    t.datetime "accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mini_league_type", "mini_league_id"], name: "index_mini_league_user_invites_on_mini_league"
    t.index ["user_id"], name: "index_mini_league_user_invites_on_user_id"
  end

  create_table "mini_league_users", force: :cascade do |t|
    t.string "mini_league_type", null: false
    t.bigint "mini_league_id", null: false
    t.bigint "user_id", null: false
    t.boolean "is_admin"
    t.integer "points_earned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mini_league_type", "mini_league_id"], name: "index_mini_league_users_on_mini_league"
    t.index ["user_id"], name: "index_mini_league_users_on_user_id"
  end

  create_table "mini_leagues", force: :cascade do |t|
    t.string "name"
    t.bigint "league_id", null: false
    t.integer "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_mini_leagues_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "league_predictions", "leagues"
  add_foreign_key "league_predictions", "users"
  add_foreign_key "league_teams", "leagues"
  add_foreign_key "match_predictions", "leagues"
  add_foreign_key "match_predictions", "matches"
  add_foreign_key "match_predictions", "mini_leagues"
  add_foreign_key "match_predictions", "users"
  add_foreign_key "matches", "leagues"
  add_foreign_key "mini_league_user_invites", "users"
  add_foreign_key "mini_league_users", "users"
  add_foreign_key "mini_leagues", "leagues"
end
