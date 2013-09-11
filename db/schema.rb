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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121119152554) do

  create_table "diagnoses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "diagnoses_visits", :id => false, :force => true do |t|
    t.integer "diagnosis_id"
    t.integer "visit_id"
  end

  create_table "enum_scale_values", :force => true do |t|
    t.string   "name"
    t.integer  "scale_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facilities", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone"
    t.string   "contact_name"
    t.string   "email"
    t.string   "homepage"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "organization_id"
  end

  create_table "organizations", :force => true do |t|
    t.string "name"
  end

  create_table "outcome_goals", :force => true do |t|
    t.integer "visit_id"
    t.integer "goal"
    t.string  "outcome_name"
    t.string  "discipline"
    t.integer "pos"
    t.boolean "inverted",     :default => false
    t.boolean "required",     :default => false
    t.string  "scale_type",   :default => "standard", :null => false
  end

  create_table "outcome_records", :force => true do |t|
    t.integer  "progress_report_id"
    t.integer  "integer_value"
    t.string   "string_value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "pos"
    t.integer  "goal_id"
  end

  create_table "outcome_relevancies", :force => true do |t|
    t.integer "diagnosis_id"
    t.integer "outcome_id"
    t.boolean "required",     :default => false
  end

  create_table "outcomes", :force => true do |t|
    t.string   "name"
    t.integer  "discipline_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "pos"
    t.string   "discipline",                            :null => false
    t.boolean  "inverted",      :default => false
    t.string   "scale_type",    :default => "standard", :null => false
  end

  create_table "patient_contacts", :force => true do |t|
    t.string   "name"
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "patient_contacts", ["email"], :name => "index_patient_contacts_on_email", :unique => true
  add_index "patient_contacts", ["reset_password_token"], :name => "index_patient_contacts_on_reset_password_token", :unique => true

  create_table "patient_contacts_patients", :id => false, :force => true do |t|
    t.integer "patient_contact_id"
    t.integer "patient_id"
  end

  create_table "patients", :force => true do |t|
    t.date     "dob"
    t.string   "gender"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "primary_contact_id"
    t.datetime "died_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "progress_reports", :force => true do |t|
    t.integer  "visit_id"
    t.date     "due_date"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "completed",                 :default => false
    t.string   "discharged_to"
    t.boolean  "scheduled",                 :default => false
    t.text     "physical_therapy_note"
    t.text     "occupational_therapy_note"
    t.text     "speech_therapy_note"
  end

  create_table "referring_facilities", :force => true do |t|
    t.integer  "facility_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "referring_physicians", :force => true do |t|
    t.integer  "facility_id"
    t.string   "name"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "all_reports",       :default => false
    t.boolean  "discharge_reports", :default => false
  end

  create_table "scales", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "site_managers", :force => true do |t|
    t.string   "name"
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.integer  "facility_id"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.boolean  "can_write",                            :default => false
    t.integer  "organization_id"
  end

  add_index "site_managers", ["email"], :name => "index_site_managers_on_email", :unique => true
  add_index "site_managers", ["reset_password_token"], :name => "index_site_managers_on_reset_password_token", :unique => true

  create_table "superadmins", :force => true do |t|
    t.string   "name"
    t.string   "email",                                :default => "",   :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.boolean  "can_write",                            :default => true
  end

  add_index "superadmins", ["email"], :name => "index_superadmins_on_email", :unique => true
  add_index "superadmins", ["reset_password_token"], :name => "index_superadmins_on_reset_password_token", :unique => true

  create_table "visits", :force => true do |t|
    t.integer  "facility_id"
    t.integer  "patient_id"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "diagnosis_id"
    t.integer  "permitted_disciplines_mask", :default => 0
    t.boolean  "prepared",                   :default => false
    t.integer  "referring_facility_id"
    t.integer  "referring_physician_id"
    t.string   "update_frequency",           :default => "weekly", :null => false
  end

end
