class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name
    end

    add_index :schools, :name, unique: true
  end
end
