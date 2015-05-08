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

ActiveRecord::Schema.define(version: 20150508020409) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "id_target",  limit: 4
    t.string   "details",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "details",    limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "details",    limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "subject_id", limit: 4
    t.string   "name",       limit: 255
    t.string   "details",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id", using: :btree

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "course_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id", using: :btree
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id", using: :btree

  create_table "user_subjects", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "subject_id", limit: 4
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_subjects", ["subject_id"], name: "index_user_subjects_on_subject_id", using: :btree
  add_index "user_subjects", ["user_id"], name: "index_user_subjects_on_user_id", using: :btree

  create_table "user_tasks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.integer  "id_course",  limit: 4
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_tasks", ["task_id"], name: "index_user_tasks_on_task_id", using: :btree
  add_index "user_tasks", ["user_id"], name: "index_user_tasks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "isSupervisor",    limit: 1
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "activities", "users"
  add_foreign_key "course_subjects", "courses"
  add_foreign_key "course_subjects", "subjects"
  add_foreign_key "tasks", "subjects"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
  add_foreign_key "user_subjects", "subjects"
  add_foreign_key "user_subjects", "users"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "users"
end
