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

ActiveRecord::Schema[7.0].define(version: 2022_05_08_212421) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "event_name"
    t.string "event_description"
    t.string "event_location"
    t.string "event_contact"
    t.datetime "event_start"
    t.datetime "event_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "friend_codes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friend_codes_on_user_id"
  end

  create_table "preperations", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.integer "event_task_preperation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_preperations_on_event_id"
  end

  create_table "prereqs", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.integer "required_task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_prereqs_on_task_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.datetime "reminder_date"
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_reminders_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_name"
    t.string "task_description"
    t.string "task_location"
    t.string "task_contact"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.datetime "due_date"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.float "color_coefficient"
    t.string "user_email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  create_table "view_permissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "viewable_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_view_permissions_on_user_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "friend_codes", "users"
  add_foreign_key "preperations", "events"
  add_foreign_key "prereqs", "tasks"
  add_foreign_key "reminders", "tasks"
  add_foreign_key "tasks", "users"
  add_foreign_key "view_permissions", "users"
end
