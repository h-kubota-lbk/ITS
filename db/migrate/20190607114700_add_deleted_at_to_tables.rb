class AddDeletedAtToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :skillsheets, :deleted_at, :datetime
    add_column :work_contents, :deleted_at, :datetime

    add_index :skillsheets, :deleted_at
    add_index :work_contents, :deleted_at
  end
end
