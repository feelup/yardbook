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

ActiveRecord::Schema.define(version: 2019_04_20_062343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "club_name"
    t.integer "number_of_holes"
  end

  create_table "hole_reviews", force: :cascade do |t|
    t.string "course_name"
    t.integer "hole_number"
    t.text "hole_review"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.index ["review_id"], name: "index_hole_reviews_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "course_name"
    t.date "rounding_date"
    t.text "course_review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "courses", default: [], array: true
  end

  add_foreign_key "hole_reviews", "reviews"
end
