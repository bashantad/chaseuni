class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam
  belongs_to :course
end
