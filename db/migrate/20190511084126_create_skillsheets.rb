class CreateSkillsheets < ActiveRecord::Migration[5.2]
  def change
    create_table :skillsheets, comment: "スキルシート情報" do |t|
      t.references :user, foreign_key: true, null: false, comment: "ユーザID"
      t.string :final_education, comment: "最終学歴"
      t.string :address, comment: "現住所"
      t.string :nearest_station_line, comment: "最寄駅（線）"
      t.string :nearest_station, comment: "最寄駅（駅）"
      t.text :specialty, comment: "得意分野"
      t.text :business_knowledge, comment: "業務知識"
      t.text :appeal_point, comment: "アピールポイント"
      t.text :license, comment: "保有資格"
      t.text :note, comment: "備考"

      t.timestamps
    end
  end
end
