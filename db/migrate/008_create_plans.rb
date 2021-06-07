class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :body
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
