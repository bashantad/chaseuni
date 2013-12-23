class Course < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :user
  has_many :exams
  validates :title, :description, :level, :faculty_id, :user_id, :presence => true
  validates :level, :numericality => {:greater_than_or_equal_to => 1, :less_than_or_equal_to => 20}
end
