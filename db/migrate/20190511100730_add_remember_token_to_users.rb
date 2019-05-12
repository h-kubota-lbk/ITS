class AddRememberTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_token, :string, limit: 191
  end
end
