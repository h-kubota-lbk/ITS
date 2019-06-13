class CreateTimeTableRows < ActiveRecord::Migration[5.2]
  def change
    create_table :time_table_rows, comment: "勤怠表一列情報" do |t|
      t.references :time_table, foreign_key: true, null: false, comment: '勤怠表ID'
      t.date :day, comment: '年月日'
      t.datetime :start_at, comment: '開始時間'
      t.datetime :end_at, comment: '終了時間'
      t.datetime :break_time, comment: '休憩時間'
      t.integer :attend_status, comment: '勤怠ステータス'
      t.integer :note, comment: '備考'

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
