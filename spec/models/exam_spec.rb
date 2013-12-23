require 'spec_helper'

describe Exam do
  before do
     @valid_attr = {
       :name => "Computer Science", 
       :difficulty_level => 2, 
       :user_id => 2, 
       :exam_type => "Objective",
       :no_of_questions => 20,
       :full_mark => 100,
       :course_id => 1
     }
   end
   context "Validations" do
     [:name, :difficulty_level, :course_id, :user_id, :exam_type, :no_of_questions, :full_mark].each do |attr|
       it {should validate_presence_of(attr)}
     end

     it "should create a Exam with valid attributes" do
       lambda{
         Exam.create(@valid_attr)
       }.should change(Exam, :count).by(1)
     end

     it "should check validity of no_of_questions" do
       u = Exam.create(@valid_attr.merge(:no_of_questions => 59))
       u.errors.messages[:no_of_questions].should_not be_nil
     end
   end
end
