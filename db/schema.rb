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

ActiveRecord::Schema[7.1].define(version: 2024_05_07_113642) do
  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id", null: false
    t.integer "professional_id", null: false
    t.integer "clinic_id", null: false
    t.integer "treatment_id", null: false
    t.integer "payment_id"
    t.string "payment_method"
    t.index ["clinic_id"], name: "index_appointments_on_clinic_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["payment_id"], name: "index_appointments_on_payment_id"
    t.index ["professional_id"], name: "index_appointments_on_professional_id"
    t.index ["treatment_id"], name: "index_appointments_on_treatment_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "document"
    t.string "phone_number"
    t.string "email"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "datetime"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.decimal "cost"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "payments"
  add_foreign_key "appointments", "professionals"
  add_foreign_key "appointments", "treatments"
end
