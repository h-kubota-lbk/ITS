class CreateTransportCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :transport_costs, comment: "交通費表情報" do |t|
      t.references :time_table, foreign_key: true, null: false, comment: '勤怠表ID'

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
