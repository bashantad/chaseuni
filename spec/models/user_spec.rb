require 'spec_helper'

describe User do
  before(:each) do
    @valid_attr = {
      :full_name => "Bashanta Dahal",
      :email => "basantad2@gmail.com",
      :password => "chaseuni@!",
      :password_confirmation => "chaseuni@!"
    }
  end
  
  it 'should create a user with valid attributes' do
    lambda{
      u = User.create(@valid_attr)
      u.should be_valid
      }.should change(User, :count).by(1)
  end
  
  context "Validations" do 
    [:email, :password, :full_name].each do |attr|
      it "should not create user with blank #{attr}" do
        u = User.create(@valid_attr.except(attr))
        u.should_not be_valid
      end
    end
  end
  
  it "should check validity of email" do
    u = User.create(@valid_attr.merge(:email => "johndoe"))
    u.errors.messages[:email].should_not be_nil
  end
end