class Course < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :user
  validates :title, :description, :level, :faculty_id, :presence => true
  validates :level, :numericality => {:greater_than_or_equal_to => 1, :less_than_or_equal_to => 20}
  has_many :exams
  has_many :enrollments
  has_many :users, :through => :enrollments
  has_many :questions
  
  def self.get_key_values
    key_values = Hash.new
    self.all.map{|course| key_values[course.title] = course.id}
    key_values
  end
end
