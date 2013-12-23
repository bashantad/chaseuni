class Exam < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates :name, :course_id, :difficulty_level, :user_id, :exam_type, :no_of_questions, :full_mark, :presence => true
  validates :no_of_questions, :numericality => {:greater_than_or_equal_to => 1, :less_than_or_equal_to => 40}
  validates :full_mark, :numericality => {:greater_than_or_equal_to => 10, :less_than_or_equal_to => 100}
end
