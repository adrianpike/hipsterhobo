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

ActiveRecord::Schema.define(:version => 20110103052136) do

  create_table "entries", :force => true do |t|
    t.string   "name"
    t.string   "source_name"
    t.string   "source_url"
    t.string   "submitter"
    t.string   "image_url"
    t.boolean  "approved",           :default => false
    t.string   "approved_by"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_uploaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "entry_id"
    t.integer  "score"
    t.string   "voter_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["entry_id"], :name => "index_votes_on_entry_id"

end
