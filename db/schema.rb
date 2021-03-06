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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120902160224) do

  create_table "heroes", :force => true do |t|
  end

  create_table "match_players", :force => true do |t|
    t.integer "match_id"
    t.integer "account_id"
    t.integer "clan_id"
    t.integer "hero_id"
    t.integer "position"
    t.integer "team"
    t.integer "level"
    t.integer "wins"
    t.integer "losses"
    t.integer "concedes"
    t.integer "concedevotes"
    t.integer "buybacks"
    t.integer "discos"
    t.integer "kicked"
    t.float   "pub_skill"
    t.integer "pub_count"
    t.float   "amm_solo_rating"
    t.integer "amm_solo_count"
    t.float   "amm_team_rating"
    t.integer "amm_team_count"
    t.float   "avg_score"
    t.integer "herokills"
    t.integer "herodmg"
    t.integer "heroexp"
    t.integer "herokillsgold"
    t.integer "heroassists"
    t.integer "deaths"
    t.integer "goldlost2death"
    t.integer "secs_dead"
    t.integer "teamcreepkills"
    t.integer "teamcreepdmg"
    t.integer "teamcreepexp"
    t.integer "teamcreepgold"
    t.integer "neutralcreepkills"
    t.integer "neutralcreepdmg"
    t.integer "neutralcreepexp"
    t.integer "neutralcreepgold"
    t.integer "bdmg"
    t.integer "bdmgexp"
    t.integer "razed"
    t.integer "bgold"
    t.integer "denies"
    t.integer "exp_denied"
    t.integer "gold"
    t.integer "gold_spent"
    t.integer "exp"
    t.integer "actions"
    t.integer "secs"
    t.integer "consumables"
    t.integer "wards"
    t.integer "time_earning_exp"
    t.integer "bloodlust"
    t.integer "doublekill"
    t.integer "triplekill"
    t.integer "quadkill"
    t.integer "annihilation"
    t.integer "ks3"
    t.integer "ks4"
    t.integer "ks5"
    t.integer "ks6"
    t.integer "ks7"
    t.integer "ks8"
    t.integer "ks9"
    t.integer "ks10"
    t.integer "ks15"
    t.integer "smackdown"
    t.integer "humiliation"
    t.integer "nemesis"
    t.integer "retribution"
    t.integer "used_token"
    t.text    "tag"
    t.text    "nickname"
    t.text    "cli_name"
  end

  add_index "match_players", ["account_id"], :name => "index_match_players_on_account_id"
  add_index "match_players", ["hero_id"], :name => "index_match_players_on_hero_id"
  add_index "match_players", ["match_id", "account_id"], :name => "match_id_account_id_check", :unique => true
  add_index "match_players", ["match_id"], :name => "index_match_players_on_match_id"

  create_table "matches", :force => true do |t|
    t.integer  "server_id"
    t.text     "map"
    t.text     "map_version"
    t.integer  "time_played"
    t.text     "file_host"
    t.integer  "file_size"
    t.text     "file_name"
    t.integer  "c_state"
    t.text     "version"
    t.datetime "mdt"
    t.integer  "avgpsr"
    t.text     "url"
    t.integer  "size"
    t.text     "name"
    t.text     "mname"
    t.integer  "mclass"
    t.integer  "private"
    t.integer  "nm"
    t.integer  "sd"
    t.integer  "rd"
    t.integer  "dm"
    t.integer  "bd"
    t.integer  "bp"
    t.integer  "cd"
    t.integer  "cm"
    t.integer  "league"
    t.integer  "max_players"
    t.integer  "tier"
    t.integer  "no_repick"
    t.integer  "no_agi"
    t.integer  "drp_itm"
    t.integer  "no_timer"
    t.integer  "rev_hs"
    t.integer  "no_swap"
    t.integer  "no_int"
    t.integer  "alt_pick"
    t.integer  "veto"
    t.integer  "shuf"
    t.integer  "no_str"
    t.integer  "no_pups"
    t.integer  "dup_h"
    t.integer  "ap"
    t.integer  "ar"
    t.integer  "em"
    t.integer  "cas"
    t.integer  "rs"
    t.integer  "nl"
    t.integer  "officl"
    t.integer  "no_stats"
    t.integer  "ab"
    t.integer  "hardcore"
    t.integer  "dev_heroes"
    t.integer  "verified_only"
    t.integer  "gated"
    t.integer  "winning_team"
  end

  create_table "players", :force => true do |t|
  end

  create_table "scraper_accounts", :force => true do |t|
    t.text "username"
    t.text "password"
  end

end
