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

ActiveRecord::Schema.define(version: 2019_12_11_042322) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "figures", force: :cascade do |t|
    t.string "figure"
    t.text "explanation"
    t.integer "paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_figures_on_paper_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paper_authors", force: :cascade do |t|
    t.integer "paper_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_paper_authors_on_author_id"
    t.index ["paper_id"], name: "index_paper_authors_on_paper_id"
  end

  create_table "paper_keywords", force: :cascade do |t|
    t.integer "paper_id"
    t.integer "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_paper_keywords_on_keyword_id"
    t.index ["paper_id"], name: "index_paper_keywords_on_paper_id"
  end

  create_table "papers", force: :cascade do |t|
    t.text "abstract"
    t.text "title"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "abstract_ja"
    t.text "pdf_url"
    t.date "published_at"
    t.string "journal"
    t.string "title_ja"
    t.integer "cite_count"
    t.integer "cited_count"
    t.integer "aixiv_id"
  end

end
