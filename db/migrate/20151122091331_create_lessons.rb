class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :body
      t.boolean :complete
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
