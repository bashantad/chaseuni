class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.string :type
      t.integer :diffulty_level
      t.references :user, index: true
      t.references :course, index: true
      t.timestamps
    end
  end
end
