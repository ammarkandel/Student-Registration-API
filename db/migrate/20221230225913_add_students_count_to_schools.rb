class AddStudentsCountToSchools < ActiveRecord::Migration[6.1]
  def change
    add_column :schools, :students_count, :integer, default: 0
  end
end
