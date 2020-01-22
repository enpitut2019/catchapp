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

ActiveRecord::Schema.define(version: 2020_01_21_141524) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "figures", force: :cascade do |t|
    t.string "figure"
    t.text "caption"
    t.integer "paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "caption_ja"
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
    t.text "arxiv_id"
    t.integer "analized", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index [nil], name: "index_users_on_confirmation_token", unique: true
  end

end
