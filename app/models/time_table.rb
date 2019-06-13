# == Schema Information
#
# Table name: time_tables # 勤怠表情報
#
#  id              :bigint           not null, primary key
#  project_name    :string(255)      not null              # プロジェクト名
#  user_id         :bigint           not null              # ユーザーID
#  time_table_type :integer          not null              # 勤怠ステータス
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TimeTable < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_one :transport_cost
end
