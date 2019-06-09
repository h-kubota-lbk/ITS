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

require 'rails_helper'

RSpec.describe TimeTable, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
