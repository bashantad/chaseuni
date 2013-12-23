class AddFullMarkToExams < ActiveRecord::Migration
  def change
    add_column :exams, :full_mark, :float
    add_column :exams, :no_of_questions, :integer
  end
end
