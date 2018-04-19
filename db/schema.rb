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

ActiveRecord::Schema.define(version: 2018_04_18_152258) do

  create_table "doors", force: :cascade do |t|
    t.boolean "is_open"
    t.integer "room_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.boolean "in_inventory"
    t.integer "room_id"
    t.integer "player_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.integer "player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.integer "room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "description"
    t.integer "north"
    t.integer "east"
    t.integer "south"
    t.integer "west"
    t.integer "level_id"
  end

end
