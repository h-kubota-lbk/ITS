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

ActiveRecord::Schema.define(version: 2019_06_07_114700) do

  create_table "skillsheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "スキルシート情報", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザID"
    t.string "final_education", comment: "最終学歴"
    t.string "address", comment: "現住所"
    t.string "nearest_station_line", comment: "最寄駅（線）"
    t.string "nearest_station", comment: "最寄駅（駅）"
    t.text "specialty", comment: "得意分野"
    t.text "business_knowledge", comment: "業務知識"
    t.text "appeal_point", comment: "アピールポイント"
    t.text "license", comment: "保有資格"
    t.text "note", comment: "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_skillsheets_on_deleted_at"
    t.index ["user_id"], name: "index_skillsheets_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ユーザ情報", force: :cascade do |t|
    t.string "name", null: false, comment: "氏名"
    t.string "name_kana", null: false, comment: "氏名（カナ）"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "password_digest", null: false, comment: "パスワード"
    t.date "birthday", null: false, comment: "生年月日"
    t.integer "gender", null: false, comment: "性別(1:男,2:女)"
    t.integer "role", default: 2, null: false, comment: "権限(1:担当営業,2:一般)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_token", limit: 191
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  create_table "work_contents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "業務内容情報", force: :cascade do |t|
    t.date "start_month", comment: "開始月"
    t.date "end_month", comment: "終了月"
    t.string "name", comment: "業務名"
    t.bigint "skillsheet_id", null: false, comment: "スキルシートID"
    t.string "industry", comment: "業界"
    t.text "os", comment: "OS"
    t.text "nw", comment: "NW"
    t.text "db", comment: "DB"
    t.text "language", comment: "言語"
    t.text "other", comment: "その他"
    t.integer "team_person", comment: "チーム人数"
    t.string "position", comment: "ポジション"
    t.string "own_phase", comment: "担当フェーズ"
    t.text "content", comment: "業務内容"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_work_contents_on_deleted_at"
    t.index ["skillsheet_id"], name: "index_work_contents_on_skillsheet_id"
  end

  add_foreign_key "skillsheets", "users"
  add_foreign_key "work_contents", "skillsheets"
end
