# == Schema Information
#
# Table name: users # ユーザ情報
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null              # 氏名
#  name_kana       :string(255)      not null              # 氏名（カナ）
#  email           :string(255)      not null              # メールアドレス
#  password_digest :string(255)      not null              # パスワード
#  birthday        :date             not null              # 生年月日
#  gender          :integer          not null              # 性別(1:男,2:女)
#  role            :integer          default(2), not null  # 権限(1:担当営業,2:一般)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(191)
#  deleted_at      :datetime
#

class User < ApplicationRecord
  acts_as_paranoid
  has_secure_password validations: true

  has_one :skillsheet, dependent: :destroy
  PERMITTED_ATTRIBUTES = %i[name name_kana email password password_confirmation
                            birthday gender role].freeze

  validates :email, presence: true, uniqueness: true

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end
end
