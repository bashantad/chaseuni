require 'spec_helper'

describe Course do
  before do
    @valid_attr = {
      :title => "Computer Science", 
      :description => "Study of computer", 
      :level => 2, 
      :faculty_id => 1,
      :user_id =>1
    }
  end
  context "Validations" do
    [:title, :description, :faculty_id, :level].each do |attr|
      it {should validate_presence_of(attr)}
    end
    
    it "should create a Course with valid attributes" do
      lambda{
        Course.create(@valid_attr)
      }.should change(Course, :count).by(1)
    end
    
    it "should check validity of level" do
      u = Course.create(@valid_attr.merge(:level => 24))
      u.errors.messages[:level].should_not be_nil
    end
  end
  
end
