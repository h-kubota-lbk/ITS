# == Schema Information
#
# Table name: time_table_rows # 勤怠表一列情報
#
#  id            :bigint           not null, primary key
#  time_table_id :bigint           not null              # 勤怠表ID
#  day           :date                                   # 年月日
#  start_at      :datetime                               # 開始時間
#  end_at        :datetime                               # 終了時間
#  break_time    :datetime                               # 休憩時間
#  attend_status :integer                                # 勤怠ステータス
#  note          :integer                                # 備考
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe TimeTableRow, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
