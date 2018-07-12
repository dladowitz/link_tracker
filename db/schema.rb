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

ActiveRecord::Schema.define(version: 2018_07_12_031148) do

  create_table "click_trackers", force: :cascade do |t|
    t.string "email"
    t.datetime "clicked_on_at"
    t.datetime "sent_on"
    t.boolean "send_immediately"
    t.integer "experiment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_click_trackers_on_experiment_id"
  end

  create_table "experiments", force: :cascade do |t|
    t.integer "wait_interval_days"
    t.string "survey_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
