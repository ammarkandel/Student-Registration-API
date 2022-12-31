class AddDeletedAtToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :deleted_at, :datetime
  end
end
