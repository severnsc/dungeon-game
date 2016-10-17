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

ActiveRecord::Schema.define(version: 20161017030034) do

  create_table "char_classes", force: :cascade do |t|
    t.string   "name"
    t.integer  "hit_points_per_level"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "player_id"
    t.integer  "race_id"
    t.integer  "class_id"
    t.string   "height"
    t.string   "weight"
    t.string   "alignment"
    t.string   "diety"
    t.integer  "level"
    t.integer  "experience"
    t.integer  "score_method"
    t.integer  "str"
    t.integer  "con"
    t.integer  "dex"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["class_id"], name: "index_characters_on_class_id"
    t.index ["player_id"], name: "index_characters_on_player_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
  end

  create_table "languages", force: :cascade do |t|
    t.integer "characters_id"
    t.string  "name"
    t.index ["characters_id"], name: "index_languages_on_characters_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "races", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "size"
    t.integer  "speed"
    t.string   "vision"
  end

end
