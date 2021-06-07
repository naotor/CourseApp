class CreateAssocGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :assoc_genres do |t|
      t.references :course, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
