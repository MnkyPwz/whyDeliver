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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20121117072823) do

  create_table "orders", :force => true do |t|
    t.integer  "merchant_id"
    t.integer  "transporter_id"
    t.integer  "status_id"
    t.float    "destination_lat"
    t.float    "destination_long"
    t.string   "address"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_email"
    t.integer  "customer_phone"
    t.integer  "charge"
    t.string   "product_name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

=======
ActiveRecord::Schema.define(:version => 20121117074600) do

  create_table "merchants", :force => true do |t|
    t.string   "name"
    t.integer  "phone"
    t.string   "address"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "merchants", ["email"], :name => "index_merchants_on_email", :unique => true
  add_index "merchants", ["reset_password_token"], :name => "index_merchants_on_reset_password_token", :unique => true

  create_table "transporters", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.float    "current_lat"
    t.float    "current_long"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "transporters", ["email"], :name => "index_transporters_on_email", :unique => true
  add_index "transporters", ["reset_password_token"], :name => "index_transporters_on_reset_password_token", :unique => true

>>>>>>> e21a7df0ee259f9d9775912865fd0227e3c1f24e
end
