require 'spec_helper'

describe FacultiesController do

  before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.code.should == "200"
    end

    it "should render 'index' template" do
      get :index
      response.should render_template('index')
    end

    it "assigns @facultys variable" do
      f = create(:faculty)
      get :index
      assigns[:faculties].should == [f]
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should render template new" do
      get :new
      response.should render_template("new")
    end

    it "assigns a new person object" do
      get "new"
      assigns[:faculty].should_not be_nil
      assigns[:faculty].should be_kind_of(Faculty)
      assigns[:faculty].should be_new_record
    end
  end

  describe "Post 'create" do
    before do
      @post_params = {:faculty =>
        {:title => "Computer Science", 
         :description => "Study of computer"}
       }
    end

    it "should assign a @faculty variable" do
      post :create, @post_params
      assigns[:faculty].should_not be_nil
      assigns[:faculty].should be_kind_of(Faculty)
    end

    context "when successful" do
    before do
      post :create, @post_params
    end

    it "should redirect to index" do
      response.should redirect_to(faculties_path)
    end

    it "should create a faculty object" do
      lambda{
        post :create, @post_params
        }.should change(Faculty, :count).by(1)
      end
    end

    context "when failure" do
    before do
      @post_params[:faculty][:title] = ''
    end

    it "re-renders the 'new' template" do
      post :create, @post_params
      response.should render_template("new")
    end

    it "doesn't create a faculty object" do
      lambda{
        post :create, @post_params
        }.should_not change(Faculty, :count)
      end
    end
  end
  describe "GET 'show'" do
     xit "returns http success" do
       get 'show', {:id => "1"}
       response.should be_success
     end
   end

   describe "GET 'edit'" do
     xit "returns http success" do
       get :edit, {:id => "1"}
       response.should be_success
     end
   end
end


