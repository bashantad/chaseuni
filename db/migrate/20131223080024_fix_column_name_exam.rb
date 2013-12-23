class FixColumnNameExam < ActiveRecord::Migration
  def change
    rename_column :exams, :diffulty_level, :difficulty_level
  end
end
