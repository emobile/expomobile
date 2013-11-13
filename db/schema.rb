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

ActiveRecord::Schema.define(:version => 20131112202019) do

  create_table "activities", :force => true do |t|
    t.string   "name",         :null => false
    t.datetime "start_date",   :null => false
    t.datetime "end_date",     :null => false
    t.string   "place",        :null => false
    t.text     "observations"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "attendee_expositions", :force => true do |t|
    t.integer  "attendee_id",  :null => false
    t.integer  "exhibitor_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "attendee_expositions", ["attendee_id"], :name => "index_attendee_expositions_on_attendee_id"
  add_index "attendee_expositions", ["exhibitor_id"], :name => "index_attendee_expositions_on_exhibitor_id"

  create_table "attendee_workshops", :force => true do |t|
    t.integer  "attendee_id", :null => false
    t.integer  "workshop_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "attendee_workshops", ["attendee_id"], :name => "index_attendee_workshops_on_attendee_id"
  add_index "attendee_workshops", ["workshop_id"], :name => "index_attendee_workshops_on_workshop_id"

  create_table "attendees", :force => true do |t|
    t.string   "attendee_id",                         :null => false
    t.string   "e_name",                              :null => false
    t.string   "e_tradename",                         :null => false
    t.string   "e_street",                            :null => false
    t.integer  "e_ext_number",                        :null => false
    t.string   "e_int_number"
    t.string   "e_colony",                            :null => false
    t.string   "e_municipality",                      :null => false
    t.string   "e_city",                              :null => false
    t.string   "e_state",                             :null => false
    t.integer  "e_zip_code",                          :null => false
    t.string   "e_rfc",                               :null => false
    t.integer  "e_lada",                              :null => false
    t.string   "e_phone",                             :null => false
    t.string   "a_name",                              :null => false
    t.string   "a_email",                             :null => false
    t.string   "a_chat"
    t.string   "a_cellphone",                         :null => false
    t.string   "a_tel_nextel"
    t.string   "a_radio_nextel"
    t.boolean  "a_is_director",    :default => false, :null => false
    t.string   "a_platform",                          :null => false
    t.string   "e_main_line",                         :null => false
    t.string   "a_sec_line",                          :null => false
    t.integer  "a_num_employees",                     :null => false
    t.string   "a_other_line",                        :null => false
    t.string   "a_web"
    t.string   "a_market_segment",                    :null => false
    t.integer  "subgroup_id",                         :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "attendees", ["subgroup_id"], :name => "attendees_subgroup_id_fk"

  create_table "conferences", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "conferencist", :null => false
    t.datetime "start_date",   :null => false
    t.datetime "end_date",     :null => false
    t.string   "place",        :null => false
    t.text     "observations"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "diaries", :force => true do |t|
    t.datetime "event_date",  :null => false
    t.string   "event_type",  :null => false
    t.string   "description", :null => false
    t.string   "place",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "exhibitors", :force => true do |t|
    t.string   "name",              :null => false
    t.string   "exposition_key",    :null => false
    t.string   "social_reason",     :null => false
    t.string   "contact",           :null => false
    t.string   "job",               :null => false
    t.string   "stand_location"
    t.string   "stand_size"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "expositions", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "location",     :null => false
    t.string   "observations"
    t.datetime "start_date",   :null => false
    t.datetime "end_date",     :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "face_to_faces", :force => true do |t|
    t.integer  "attendee_id", :null => false
    t.string   "int_contact", :null => false
    t.string   "int_job",     :null => false
    t.string   "int_name",    :null => false
    t.string   "subject",     :null => false
    t.datetime "start_date",  :null => false
    t.datetime "end_date",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "face_to_faces", ["attendee_id"], :name => "face_to_faces_attendee_id_fk"

  create_table "groups", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hours", :force => true do |t|
    t.datetime "start_date", :null => false
    t.datetime "end_date",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "massive_loads", :force => true do |t|
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "excel_file_file_name"
    t.string   "excel_file_content_type"
    t.integer  "excel_file_file_size"
    t.datetime "excel_file_updated_at"
  end

  create_table "nips", :force => true do |t|
    t.string   "nip",         :null => false
    t.datetime "sent"
    t.integer  "attendee_id", :null => false
    t.integer  "times_sent"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "nips", ["attendee_id"], :name => "nips_attendee_id_fk"

  create_table "offerts", :force => true do |t|
    t.integer  "exhibitor_id",                               :null => false
    t.string   "description",                                :null => false
    t.decimal  "price",        :precision => 8, :scale => 2, :null => false
    t.datetime "start_date",                                 :null => false
    t.datetime "end_date",                                   :null => false
    t.string   "location",                                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "offerts", ["exhibitor_id"], :name => "offerts_exhibitor_id_fk"

  create_table "ratings", :force => true do |t|
    t.integer  "value",      :null => false
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",                              :null => false
    t.boolean  "is_super_admin", :default => false, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "room_key",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "workshop_id", :null => false
    t.integer  "subgroup_id", :null => false
    t.integer  "hour_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "schedules", ["hour_id"], :name => "schedules_hour_id_fk"
  add_index "schedules", ["subgroup_id"], :name => "schedules_subgroup_id_fk"
  add_index "schedules", ["workshop_id"], :name => "schedules_workshop_id_fk"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sponsors", :force => true do |t|
    t.string   "name",               :null => false
    t.string   "contact",            :null => false
    t.string   "job"
    t.string   "social_reason",      :null => false
    t.string   "web_page"
    t.string   "work_street"
    t.string   "work_street_number"
    t.string   "work_colony"
    t.string   "work_zip"
    t.string   "phone",              :null => false
    t.string   "email",              :null => false
    t.string   "twitter"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "stands", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subgroups", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "leader",       :null => false
    t.string   "subgroup_key", :null => false
    t.integer  "group_id",     :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "subgroups", ["group_id"], :name => "subgroups_group_id_fk"

  create_table "system_configurations", :force => true do |t|
    t.string   "token"
    t.integer  "workshop_tolerance"
    t.integer  "exposition_tolerance"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                             :null => false
    t.string   "last_name",                              :null => false
    t.string   "phone",                                  :null => false
    t.string   "address",                                :null => false
    t.string   "city",                                   :null => false
    t.string   "state",                                  :null => false
    t.integer  "zip",                                    :null => false
    t.string   "country",                                :null => false
    t.integer  "role_id",                :default => 2,  :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username",                               :null => false
    t.string   "email",                                  :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "users_role_id_fk"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "workshops", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "workshop_key", :null => false
    t.string   "teacher_name", :null => false
    t.integer  "room_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "workshops", ["room_id"], :name => "workshops_room_id_fk"

  add_foreign_key "attendees", "subgroups", :name => "attendees_subgroup_id_fk"

  add_foreign_key "face_to_faces", "attendees", :name => "face_to_faces_attendee_id_fk"

  add_foreign_key "nips", "attendees", :name => "nips_attendee_id_fk", :dependent => :delete

  add_foreign_key "offerts", "exhibitors", :name => "offerts_exhibitor_id_fk", :dependent => :delete

  add_foreign_key "schedules", "hours", :name => "schedules_hour_id_fk"
  add_foreign_key "schedules", "subgroups", :name => "schedules_subgroup_id_fk"
  add_foreign_key "schedules", "workshops", :name => "schedules_workshop_id_fk"

  add_foreign_key "subgroups", "groups", :name => "subgroups_group_id_fk"

  add_foreign_key "users", "roles", :name => "users_role_id_fk"

  add_foreign_key "workshops", "rooms", :name => "workshops_room_id_fk"

end
