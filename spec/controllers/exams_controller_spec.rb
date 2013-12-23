require 'spec_helper'

describe ExamsController do

  before do
    @user = create(:user)
    sign_in(@user)
    @course = create(:course)
  end
  
  let(:valid_attributes) { { "name" => "MyString", "difficulty_level" => 2, :exam_type => "Subjective", :course_id => @course.id, :user_id => @user.id } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExamsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all exams as @exams" do
      exam = Exam.create! valid_attributes
      get :index, {}, valid_session
      assigns(:exams).should eq([exam])
    end
  end

  describe "GET show" do
    it "assigns the requested exam as @exam" do
      exam = Exam.create! valid_attributes
      get :show, {:id => exam.to_param}, valid_session
      assigns(:exam).should eq(exam)
    end
  end

  describe "GET new" do
    it "assigns a new exam as @exam" do
      get :new, {}, valid_session
      assigns(:exam).should be_a_new(Exam)
    end
  end

  describe "GET edit" do
    it "assigns the requested exam as @exam" do
      exam = Exam.create! valid_attributes
      get :edit, {:id => exam.to_param}, valid_session
      assigns(:exam).should eq(exam)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Exam" do
        expect {
          post :create, {:exam => valid_attributes}, valid_session
        }.to change(Exam, :count).by(1)
      end

      it "assigns a newly created exam as @exam" do
        post :create, {:exam => valid_attributes}, valid_session
        assigns(:exam).should be_a(Exam)
        assigns(:exam).should be_persisted
      end

      it "redirects to the created exam" do
        post :create, {:exam => valid_attributes}, valid_session
        response.should redirect_to(Exam.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved exam as @exam" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exam.any_instance.stub(:save).and_return(false)
        post :create, {:exam => { "name" => "invalid value" }}, valid_session
        assigns(:exam).should be_a_new(Exam)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exam.any_instance.stub(:save).and_return(false)
        post :create, {:exam => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested exam" do
        exam = Exam.create! valid_attributes
        # Assuming there are no other exams in the database, this
        # specifies that the Exam created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Exam.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => exam.to_param, :exam => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested exam as @exam" do
        exam = Exam.create! valid_attributes
        put :update, {:id => exam.to_param, :exam => valid_attributes}, valid_session
        assigns(:exam).should eq(exam)
      end

      it "redirects to the exam" do
        exam = Exam.create! valid_attributes
        put :update, {:id => exam.to_param, :exam => valid_attributes}, valid_session
        response.should redirect_to(exam)
      end
    end

    describe "with invalid params" do
      it "assigns the exam as @exam" do
        exam = Exam.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Exam.any_instance.stub(:save).and_return(false)
        put :update, {:id => exam.to_param, :exam => { "name" => "invalid value" }}, valid_session
        assigns(:exam).should eq(exam)
      end

      it "re-renders the 'edit' template" do
        exam = Exam.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Exam.any_instance.stub(:save).and_return(false)
        put :update, {:id => exam.to_param, :exam => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested exam" do
      exam = Exam.create! valid_attributes
      expect {
        delete :destroy, {:id => exam.to_param}, valid_session
      }.to change(Exam, :count).by(-1)
    end

    it "redirects to the exams list" do
      exam = Exam.create! valid_attributes
      delete :destroy, {:id => exam.to_param}, valid_session
      response.should redirect_to(exams_url)
    end
  end

end
