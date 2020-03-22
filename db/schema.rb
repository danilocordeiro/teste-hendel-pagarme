# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_22_181927) do

  create_table "information", force: :cascade do |t|
    t.string "document_number"
    t.string "street"
    t.string "neighborhood"
    t.string "zipcode"
    t.string "street_number"
    t.string "complementary"
    t.string "ddd"
    t.string "phone_number"
    t.integer "member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_information_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "recipients", force: :cascade do |t|
    t.string "bank_code", limit: 3
    t.string "agencia", limit: 4
    t.string "agendia_dv", limit: 1
    t.string "conta", limit: 10
    t.string "conta_dv", limit: 1
    t.string "legal_name", limit: 60
    t.string "document_number", limit: 14
    t.text "code"
    t.boolean "transfer_enabled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "split_rules", force: :cascade do |t|
    t.string "percentage"
    t.integer "transaction_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_split_rules_on_recipient_id"
    t.index ["transaction_id"], name: "index_split_rules_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.string "pay_method"
    t.integer "member_id"
    t.text "card_hash"
    t.boolean "division"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_transactions_on_member_id"
  end

  add_foreign_key "information", "members"
  add_foreign_key "split_rules", "recipients"
  add_foreign_key "split_rules", "transactions"
  add_foreign_key "transactions", "members"
end
