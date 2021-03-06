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

ActiveRecord::Schema.define(:version => 1) do

  create_table "menus", :force => true do |t|
    t.string  "name",     :limit => 20, :default => "",   :null => false
    t.integer "position",               :default => 0,    :null => false
    t.boolean "show",                   :default => true, :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "ip",         :limit => 20, :default => "",   :null => false
    t.integer  "chose",                    :default => 0,    :null => false
    t.string   "date",                     :default => "20", :null => false
    t.datetime "updated_at"
  end

end
