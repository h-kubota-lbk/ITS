class CreateWorkContents < ActiveRecord::Migration[5.2]
  def change
    create_table :work_contents, comment: "業務内容情報" do |t|
      t.date :start_month, comment: "開始月"
      t.date :end_month, comment: "終了月"
      t.string :name, comment: "業務名"
      t.references :skillsheet, foreign_key: true, null: false, comment: "スキルシートID"
      t.string :industry, comment: "業界"
      t.text :os, comment: "OS"
      t.text :nw, comment: "NW"
      t.text :db, comment: "DB"
      t.text :language, comment: "言語"
      t.text :other, comment: "その他"
      t.integer :team_person, comment: "チーム人数"
      t.string :position, comment: "ポジション"
      t.string :own_phase, comment: "担当フェーズ"
      t.text :content, comment: "業務内容"

      t.timestamps
    end
  end
end
