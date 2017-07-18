# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170712192133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draft_picks", force: :cascade do |t|
    t.integer  "league_id",  null: false
    t.integer  "user_id",    null: false
    t.integer  "player_id"
    t.integer  "position",   null: false
    t.boolean  "joker"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id", "position"], name: "index_draft_picks_on_league_id_and_position", unique: true, using: :btree
    t.index ["league_id"], name: "index_draft_picks_on_league_id", using: :btree
    t.index ["player_id"], name: "index_draft_picks_on_player_id", using: :btree
    t.index ["user_id"], name: "index_draft_picks_on_user_id", using: :btree
  end

  create_table "league_users", force: :cascade do |t|
    t.integer  "league_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_users_on_league_id", using: :btree
    t.index ["user_id"], name: "index_league_users_on_user_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leagues_on_user_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.integer  "league_id",    null: false
    t.integer  "team_id",      null: false
    t.string   "name",         null: false
    t.string   "position",     null: false
    t.integer  "games_played"
    t.decimal  "grade"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "allstar_team"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["league_id"], name: "index_players_on_league_id", using: :btree
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_drafts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "position",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_drafts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
  end

end
