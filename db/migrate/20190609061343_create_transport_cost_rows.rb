class CreateTransportCostRows < ActiveRecord::Migration[5.2]
  def change
    create_table :transport_cost_rows, comment: "交通費表表一列情報" do |t|
      t.references :time_table, foreign_key: true, null: false, comment: '勤怠表ID'
      t.date :day, comment: '年月日'
      t.string :route, comment: '経路'
      t.integer :transport_type, comment: '交通手段（1:JR,2:航空機,3:私鉄,4:バス,5:タクシー,6:その他）'
      t.decimal :cost, precision: 15, scale: 2, comment: '交通費'
      t.decimal :lodging_cost, precision: 15, scale: 2, comment: '宿泊費'
      t.integer :note, comment: '備考'

      t.timestamps
    end
  end
end
