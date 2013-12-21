class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :level
      t.references :faculty, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
