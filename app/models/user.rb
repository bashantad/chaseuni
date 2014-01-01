class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :full_name, :presence => true         
  #has_many :courses
  has_many :exams
  has_many :results
  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :questions
end
