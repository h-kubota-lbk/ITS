class CreateTimeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :time_tables, comment: "勤怠表情報" do |t|
      t.string :project_name, null: false, comment: 'プロジェクト名'
      t.references :user, foreign_key: true, null: false, comment: 'ユーザーID'
      t.integer :time_table_type, null: false, comment: '勤怠ステータス'

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
