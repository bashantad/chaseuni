class FixCoumnNameExam < ActiveRecord::Migration
  def change
    change_column :exams, :difficulty_level, :string 
  end
end
