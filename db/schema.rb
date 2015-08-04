# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150802121946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.integer  "league_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clubs", ["league_id"], name: "index_clubs_on_league_id", using: :btree

  create_table "footmarks", force: :cascade do |t|
    t.integer  "nr"
    t.date     "visit_date"
    t.string   "ground"
    t.string   "street"
    t.string   "city"
    t.integer  "goals_home"
    t.integer  "goals_away"
    t.string   "season"
    t.string   "kickoff"
    t.integer  "gate"
    t.decimal  "ticket_price"
    t.boolean  "countfor92",     null: false
    t.integer  "home_club_id",   null: false
    t.integer  "away_club_id",   null: false
    t.integer  "league_id"
    t.string   "programme_link"
    t.string   "ticket_link"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "footmarks", ["away_club_id"], name: "index_footmarks_on_away_club_id", using: :btree
  add_index "footmarks", ["home_club_id"], name: "index_footmarks_on_home_club_id", using: :btree
  add_index "footmarks", ["league_id"], name: "index_footmarks_on_league_id", using: :btree
  add_index "footmarks", ["nr"], name: "index_footmarks_on_nr", unique: true, using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "country"
    t.string   "name"
    t.integer  "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "leagues", ["country"], name: "index_leagues_on_country", using: :btree
  add_index "leagues", ["step"], name: "index_leagues_on_step", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
