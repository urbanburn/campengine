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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160109203540) do

  create_table "camps", force: :cascade do |t|
    t.string   "name",                    null: false
    t.text     "description",             null: false
    t.text     "size_of_necessary_space"
    t.text     "camp_necessities"
    t.boolean  "needs_art_grant"
    t.integer  "number_of_members"
    t.boolean  "seeking_members"
    t.text     "noise_level"
    t.text     "safety_risks"
    t.string   "contact_email",           null: false
    t.string   "contact_name",            null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
