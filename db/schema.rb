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

ActiveRecord::Schema[8.0].define(version: 2025_08_24_192208) do
  create_table "budget_products", force: :cascade do |t|
    t.float "value"
    t.integer "quantity"
    t.integer "product_id", null: false
    t.integer "budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_budget_products_on_budget_id"
    t.index ["product_id"], name: "index_budget_products_on_product_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.float "value"
    t.date "deadline"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "budget_id", null: false
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_sales_on_budget_id"
  end

  add_foreign_key "budget_products", "budgets"
  add_foreign_key "budget_products", "products"
  add_foreign_key "sales", "budgets"
end
