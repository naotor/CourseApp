class CreateAssignStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :assign_students do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
