# == Schema Information
#
# Table name: skillsheets # スキルシート情報
#
#  id                   :bigint           not null, primary key
#  user_id              :bigint           not null              # ユーザID
#  final_education      :string(255)                            # 最終学歴
#  address              :string(255)                            # 現住所
#  nearest_station_line :string(255)                            # 最寄駅（線）
#  nearest_station      :string(255)                            # 最寄駅（駅）
#  specialty            :text(65535)                            # 得意分野
#  business_knowledge   :text(65535)                            # 業務知識
#  appeal_point         :text(65535)                            # アピールポイント
#  license              :text(65535)                            # 保有資格
#  note                 :text(65535)                            # 備考
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Skillsheet < ApplicationRecord
  belongs_to :user
  has_many :work_contents
end
