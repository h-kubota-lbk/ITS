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

ActiveRecord::Schema.define(version: 2019_06_09_061343) do

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

  create_table "time_table_rows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "勤怠表一列情報", force: :cascade do |t|
    t.bigint "time_table_id", null: false, comment: "勤怠表ID"
    t.date "day", comment: "年月日"
    t.datetime "start_at", comment: "開始時間"
    t.datetime "end_at", comment: "終了時間"
    t.datetime "break_time", comment: "休憩時間"
    t.integer "attend_status", comment: "勤怠ステータス"
    t.integer "note", comment: "備考"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_time_table_rows_on_deleted_at"
    t.index ["time_table_id"], name: "index_time_table_rows_on_time_table_id"
  end

  create_table "time_tables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "勤怠表情報", force: :cascade do |t|
    t.string "project_name", null: false, comment: "プロジェクト名"
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.integer "time_table_type", null: false, comment: "勤怠ステータス"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_time_tables_on_deleted_at"
    t.index ["user_id"], name: "index_time_tables_on_user_id"
  end

  create_table "transport_cost_rows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "交通費表表一列情報", force: :cascade do |t|
    t.bigint "time_table_id", null: false, comment: "勤怠表ID"
    t.date "day", comment: "年月日"
    t.string "route", comment: "経路"
    t.integer "transport_type", comment: "交通手段（1:JR,2:航空機,3:私鉄,4:バス,5:タクシー,6:その他）"
    t.decimal "cost", precision: 15, scale: 2, comment: "交通費"
    t.decimal "lodging_cost", precision: 15, scale: 2, comment: "宿泊費"
    t.integer "note", comment: "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_table_id"], name: "index_transport_cost_rows_on_time_table_id"
  end

  create_table "transport_costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "交通費表情報", force: :cascade do |t|
    t.bigint "time_table_id", null: false, comment: "勤怠表ID"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_transport_costs_on_deleted_at"
    t.index ["time_table_id"], name: "index_transport_costs_on_time_table_id"
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
  add_foreign_key "time_table_rows", "time_tables"
  add_foreign_key "time_tables", "users"
  add_foreign_key "transport_cost_rows", "time_tables"
  add_foreign_key "transport_costs", "time_tables"
  add_foreign_key "work_contents", "skillsheets"
end
