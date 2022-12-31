class AddDeletedAtToSchools < ActiveRecord::Migration[6.1]
  def change
    add_column :schools, :deleted_at, :datetime
  end
end
