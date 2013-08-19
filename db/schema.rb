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

ActiveRecord::Schema.define(:version => 20130817060558) do

  create_table "evaluations", :force => true do |t|
    t.integer  "student_id",                     :null => false
    t.integer  "school_subject_id",              :null => false
    t.integer  "value",             :limit => 1, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "evaluations", ["school_subject_id"], :name => "index_evaluations_on_school_subject_id"
  add_index "evaluations", ["student_id"], :name => "index_evaluations_on_student_id"

  create_table "school_subjects", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "school_subjects_study_groups", :id => false, :force => true do |t|
    t.integer "school_subject_id", :null => false
    t.integer "study_group_id",    :null => false
  end

  add_index "school_subjects_study_groups", ["school_subject_id"], :name => "index_school_subjects_study_groups_on_school_subject_id"
  add_index "school_subjects_study_groups", ["study_group_id"], :name => "index_school_subjects_study_groups_on_study_group_id"

  create_table "students", :force => true do |t|
    t.string   "name",           :limit => 100, :default => "", :null => false
    t.string   "secondname",     :limit => 100, :default => "", :null => false
    t.integer  "study_group_id"
    t.date     "dob",                                           :null => false
    t.string   "email",          :limit => 100, :default => ""
    t.string   "ipreg",          :limit => 100, :default => "", :null => false
    t.float    "average",                                       :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "students", ["average"], :name => "index_students_on_average"
  add_index "students", ["ipreg"], :name => "index_students_on_ipreg"
  add_index "students", ["secondname"], :name => "index_students_on_secondname"
  add_index "students", ["study_group_id"], :name => "index_students_on_study_group_id"

  create_table "study_groups", :force => true do |t|
    t.string   "title",          :limit => 100, :default => "", :null => false
    t.integer  "semestr",        :limit => 2,   :default => 1,  :null => false
    t.text     "characteristic"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "study_groups", ["semestr"], :name => "index_study_groups_on_semestr"

end
