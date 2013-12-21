require 'spec_helper'

describe Faculty do
  before do
    @valid_attr = {:title => "Computer Science", :description => "Study of Computer"}
  end
  [:title, :description].each do |attr|
    it {should validate_presence_of(attr)}
  end
  it 'should create a faculty with valid attributes' do
     lambda{
       u = Faculty.create(@valid_attr)
       u.should be_valid
       }.should change(Faculty, :count).by(1)
   end
end
