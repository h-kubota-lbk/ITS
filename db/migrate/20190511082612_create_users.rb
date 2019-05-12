class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, comment: "ユーザ情報" do |t|
      t.string :name, null: false, comment: "氏名"
      t.string :name_kana, null: false, comment: "氏名（カナ）"
      t.string :email, null: false, comment: "メールアドレス"
      t.string :password_digest, null: false, comment: "パスワード"
      t.date :birthday, null: false, comment: "生年月日"
      t.integer :gender, null: false, comment: "性別(1:男,2:女)"
      t.integer :role, null: false, default: 2, comment: "権限(1:担当営業,2:一般)"

      t.timestamps
    end
  end
end
