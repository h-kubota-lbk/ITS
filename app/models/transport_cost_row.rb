# == Schema Information
#
# Table name: transport_cost_rows # 交通費表表一列情報
#
#  id             :bigint           not null, primary key
#  time_table_id  :bigint           not null              # 勤怠表ID
#  day            :date                                   # 年月日
#  route          :string(255)                            # 経路
#  transport_type :integer                                # 交通手段（1:JR,2:航空機,3:私鉄,4:バス,5:タクシー,6:その他）
#  cost           :decimal(15, 2)                         # 交通費
#  lodging_cost   :decimal(15, 2)                         # 宿泊費
#  note           :integer                                # 備考
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TransportCostRow < ApplicationRecord
end
