class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  validates :user_id, uniqueness: {scope: :course_id}, presence: true  
  def self.isEnrolled(user, course)
    !Enrollment.where(:user_id => user.id, :course_id => course.id).blank?
  end
end
