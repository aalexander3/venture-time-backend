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

ActiveRecord::Schema.define(version: 2018_04_12_124634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interests", force: :cascade do |t|
    t.string "category"
    t.bigint "investor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investor_id"], name: "index_interests_on_investor_id"
  end

  create_table "investors", force: :cascade do |t|
    t.string "name"
    t.string "mission"
    t.text "description"
    t.string "interests"
    t.string "logo"
    t.string "url"
    t.integer "funds_to_invest"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "start_up_investors", force: :cascade do |t|
    t.bigint "investor_id"
    t.bigint "start_up_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investor_id"], name: "index_start_up_investors_on_investor_id"
    t.index ["start_up_id"], name: "index_start_up_investors_on_start_up_id"
  end

  create_table "start_ups", force: :cascade do |t|
    t.string "name"
    t.string "mission"
    t.text "description"
    t.string "field"
    t.string "logo"
    t.string "url"
    t.integer "funds_needed"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
