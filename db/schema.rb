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

ActiveRecord::Schema[7.0].define(version: 2022_07_26_002610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.integer "batch_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.date "date"
    t.string "category"
    t.integer "quantity"
    t.integer "unit_price"
    t.integer "total_amount"
    t.text "description"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "batch_id"
    t.bigint "flock_id"
    t.index ["batch_id"], name: "index_expenses_on_batch_id"
    t.index ["type_id"], name: "index_expenses_on_type_id"
  end

  create_table "financial_searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flocks", force: :cascade do |t|
    t.datetime "date_in", precision: nil
    t.datetime "retirement_date"
    t.string "source"
    t.string "flock_stored"
    t.integer "initial_stock"
    t.integer "died_stock"
    t.text "notes"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "batch_id"
    t.integer "batch_no"
    t.index ["batch_id"], name: "index_flocks_on_batch_id"
    t.index ["type_id"], name: "index_flocks_on_type_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.datetime "date"
    t.string "category"
    t.integer "quantity"
    t.integer "unit_price"
    t.integer "total_amount"
    t.text "description"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "batch_id"
    t.bigint "flock_id"
    t.index ["batch_id"], name: "index_incomes_on_batch_id"
    t.index ["type_id"], name: "index_incomes_on_type_id"
  end

  create_table "report_searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expenses", "batches"
  add_foreign_key "expenses", "types"
  add_foreign_key "flocks", "batches"
  add_foreign_key "flocks", "types"
  add_foreign_key "incomes", "batches"
  add_foreign_key "incomes", "types"
end
