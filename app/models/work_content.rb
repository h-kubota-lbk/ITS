# == Schema Information
#
# Table name: work_contents # 業務内容情報
#
#  id            :bigint           not null, primary key
#  start_month   :date                                   # 開始月
#  end_month     :date                                   # 終了月
#  name          :string(255)                            # 業務名
#  skillsheet_id :bigint           not null              # スキルシートID
#  industry      :string(255)                            # 業界
#  os            :text(65535)                            # OS
#  nw            :text(65535)                            # NW
#  db            :text(65535)                            # DB
#  language      :text(65535)                            # 言語
#  other         :text(65535)                            # その他
#  team_person   :integer                                # チーム人数
#  position      :string(255)                            # ポジション
#  own_phase     :string(255)                            # 担当フェーズ
#  content       :text(65535)                            # 業務内容
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  deleted_at    :datetime
#

class WorkContent < ApplicationRecord
  acts_as_paranoid

  belongs_to :skillsheet

  def term
    return nil if end_month.nil? || start_month.nil?

    (end_month.year - start_month.year) * 12 + end_month.month + (13 - start_month.month)
  end
end
