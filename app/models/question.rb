class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  validates :user_id, :course_id, :title, :presence => true
end
