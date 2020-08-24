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

ActiveRecord::Schema.define(version: 2020_08_17_051052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string "name", default: ""
    t.integer "status", default: 0
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_banks_on_country_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "candidate_code"
    t.string "name", default: ""
    t.string "email", default: ""
    t.string "lastname", default: ""
    t.date "birthdate", default: "2000-01-01"
    t.integer "status", default: 0
    t.text "additional_info", default: ""
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_candidates_on_country_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_code"
    t.string "name"
    t.integer "economic_solvency", default: 0
    t.integer "status", default: 0
    t.text "additional_info", default: ""
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_companies_on_country_id"
  end

  create_table "company_contacts", force: :cascade do |t|
    t.string "contact_name", default: ""
    t.string "contact_position", default: ""
    t.string "contact_phone", default: ""
    t.string "contact_email", default: ""
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contactable_type", "contactable_id"], name: "index_company_contacts_on_contactable_type_and_contactable_id"
  end

  create_table "company_jobs", force: :cascade do |t|
    t.string "company_job_code"
    t.text "job_detail", default: ""
    t.decimal "monthly_amount", precision: 5, scale: 2
    t.decimal "debt_amount", precision: 5, scale: 2
    t.date "contract_date"
    t.integer "job_status", default: 0
    t.text "additional_info", default: ""
    t.bigint "country_id"
    t.bigint "company_id"
    t.bigint "sale_employee_id"
    t.bigint "interview_employee_id"
    t.bigint "payment_employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_jobs_on_company_id"
    t.index ["country_id"], name: "index_company_jobs_on_country_id"
    t.index ["interview_employee_id"], name: "index_company_jobs_on_interview_employee_id"
    t.index ["payment_employee_id"], name: "index_company_jobs_on_payment_employee_id"
    t.index ["sale_employee_id"], name: "index_company_jobs_on_sale_employee_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "url_flag"
    t.string "symbol_currency"
    t.string "currency_type"
    t.string "dec_currency", default: "."
    t.string "thousand_currency", default: ","
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "document_value", default: ""
    t.integer "document_type", default: 0
    t.string "documentable_type"
    t.bigint "documentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id"
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.string "secret"
    t.text "redirect_uri"
    t.string "scopes", default: ""
    t.boolean "confidential", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone_number"
    t.integer "phone_type", default: 0
    t.string "phoneable_type"
    t.bigint "phoneable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable_type_and_phoneable_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "user_banks", force: :cascade do |t|
    t.string "account_number"
    t.integer "account_type", default: 0
    t.bigint "user_id"
    t.bigint "bank_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_id"], name: "index_user_banks_on_bank_id"
    t.index ["user_id"], name: "index_user_banks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code_user"
    t.string "name"
    t.string "lastname"
    t.date "birthdate", default: "2000-01-01"
    t.string "internal_emaiil"
    t.jsonb "emergency_info"
    t.integer "status", default: 0
    t.text "additional_info", default: ""
    t.bigint "country_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string "position"
    t.string "company_name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.boolean "current_work_experience", default: false
    t.bigint "country_id"
    t.string "workable_type"
    t.bigint "workable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_work_experiences_on_country_id"
    t.index ["workable_type", "workable_id"], name: "index_work_experiences_on_workable_type_and_workable_id"
  end

  add_foreign_key "banks", "countries"
  add_foreign_key "candidates", "countries"
  add_foreign_key "companies", "countries"
  add_foreign_key "company_jobs", "companies"
  add_foreign_key "company_jobs", "countries"
  add_foreign_key "company_jobs", "users", column: "interview_employee_id"
  add_foreign_key "company_jobs", "users", column: "payment_employee_id"
  add_foreign_key "company_jobs", "users", column: "sale_employee_id"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_grants", "users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
  add_foreign_key "user_banks", "banks"
  add_foreign_key "user_banks", "users"
  add_foreign_key "users", "countries"
  add_foreign_key "work_experiences", "countries"
end
