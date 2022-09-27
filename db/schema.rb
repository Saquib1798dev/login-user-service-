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

ActiveRecord::Schema.define(version: 2022_09_20_134210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "otps", force: :cascade do |t|
    t.integer "otp_digits"
    t.boolean "otp_verified"
    t.string "otp_type"
    t.string "otp_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["otp_digits"], name: "index_otps_on_otp_digits", unique: true
    t.index ["otp_token"], name: "index_otps_on_otp_token", unique: true
    t.index ["user_id"], name: "index_otps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.bigint "full_phone_number"
    t.string "email"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
