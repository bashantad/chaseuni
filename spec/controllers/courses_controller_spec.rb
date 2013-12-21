require 'spec_helper'

describe CoursesController do

  before do
    user = create(:user)
    sign_in(user)
    @faculty = create(:faculty)
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

    it "assigns @courses variable" do
      f = create(:course)
      get :index
      assigns[:courses].should == [f]
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
      assigns[:course].should_not be_nil
      assigns[:course].should be_kind_of(Course)
      assigns[:course].should be_new_record
    end
  end

  describe "Post 'create" do
    before do
      @post_params = {:course =>
        {:title => "Computer Science", 
         :description => "Study of computer", 
         :level => 2, 
         :faculty_id => @faculty.id}
      }
    end

    it "should assign a @course variable" do
      post :create, @post_params
      assigns[:course].should_not be_nil
      assigns[:course].should be_kind_of(Course)
    end

    context "when successful" do
    before do
      post :create, @post_params
    end

    it "should redirect to index" do
      response.should redirect_to(courses_path)
    end

    it "should create a Course object" do
      lambda{
        post :create, @post_params
        }.should change(Course, :count).by(1)
      end
    end

    context "when failure" do
    before do
      @post_params[:course][:title] = ''
    end

    it "re-renders the 'new' template" do
      post :create, @post_params
      response.should render_template("new")
    end

    it "doesn't create a course object" do
      lambda{
        post :create, @post_params
        }.should_not change(Course, :count)
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


