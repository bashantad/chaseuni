class FixColumnTypeExam < ActiveRecord::Migration
  def change
    rename_column :exams, :type, :exam_type
  end
end
