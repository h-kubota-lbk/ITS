# == Schema Information
#
# Table name: transport_costs # 交通費表情報
#
#  id            :bigint           not null, primary key
#  time_table_id :bigint           not null              # 勤怠表ID
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TransportCost < ApplicationRecord
end
