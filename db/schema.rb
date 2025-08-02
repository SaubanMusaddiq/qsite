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

ActiveRecord::Schema[7.1].define(version: 2025_07_27_222449) do
  create_table "adonis_schema", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "batch", null: false
    t.timestamp "migration_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "adonis_schema_versions", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "version", null: false
  end

  create_table "chapters", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "title_en"
    t.string "title_kn"
    t.string "title_ar"
    t.integer "number"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "info", size: :medium
    t.string "title_trans_en"
    t.string "title_trans_kn"
    t.integer "verse_count"
    t.string "origin"
    t.integer "rukoo_count"
  end

  create_table "dq_users", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "password", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["email"], name: "dq_users_email_unique", unique: true
  end

  create_table "notes", charset: "utf8mb3", force: :cascade do |t|
    t.integer "chapter_id"
    t.integer "number"
    t.text "content", size: :medium
    t.index ["chapter_id"], name: "fk_rails_7975025da3"
  end

  create_table "translations", charset: "utf8mb3", force: :cascade do |t|
    t.integer "chapter_id"
    t.integer "number"
    t.integer "number_end"
    t.text "content", size: :medium
    t.index ["chapter_id"], name: "fk_rails_e2b4f53c59"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "verses", charset: "utf8mb3", force: :cascade do |t|
    t.integer "chapter_id"
    t.integer "number"
    t.text "content", size: :medium
    t.index ["chapter_id"], name: "fk_rails_4f5f5f8ab1"
  end

  add_foreign_key "notes", "chapters"
  add_foreign_key "translations", "chapters"
  add_foreign_key "verses", "chapters"
end
