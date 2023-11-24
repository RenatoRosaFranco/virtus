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

ActiveRecord::Schema.define(version: 2023_11_24_211138) do

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "neighborhood"
    t.string "number"
    t.string "complement"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id"
    t.integer "city_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "approaches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "approaches_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "approach_id", null: false
    t.index ["approach_id", "user_id"], name: "index_approaches_users_on_approach_id_and_user_id"
    t.index ["user_id", "approach_id"], name: "index_approaches_users_on_user_id_and_approach_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.boolean "capital"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "psychologist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "therapy_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["therapy_session_id"], name: "index_messages_on_therapy_session_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.integer "user_id"
    t.integer "therapy_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["therapy_session_id"], name: "index_payments_on_therapy_session_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "document"
    t.integer "gender"
    t.string "phone_prefix"
    t.string "phone_number"
    t.string "source_of_discovery"
    t.boolean "terms"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "psychologist_id"
    t.integer "user_id"
    t.string "score"
    t.integer "attention"
    t.integer "environment"
    t.integer "punctuality"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "specialties_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "specialty_id", null: false
    t.index ["specialty_id", "user_id"], name: "index_specialties_users_on_specialty_id_and_user_id"
    t.index ["user_id", "specialty_id"], name: "index_specialties_users_on_user_id_and_specialty_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "therapy_sessions", force: :cascade do |t|
    t.integer "therapist_id"
    t.integer "patient_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
