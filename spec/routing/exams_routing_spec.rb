require "spec_helper"

describe ExamsController do
  describe "routing" do

    it "routes to #index" do
      get("/courses/1/exams").should route_to("exams#index", :course_id => "1")
    end

    it "routes to #new" do
      get("/courses/1/exams/new").should route_to("exams#new", :course_id => "1")
    end

    it "routes to #show" do
      get("/courses/1/exams/2").should route_to("exams#show", :id => "2", :course_id => "1")
    end

    it "routes to #edit" do
      get("/courses/1/exams/2/edit").should route_to("exams#edit", :id => "2", :course_id => "1")
    end

    it "routes to #create" do
      post("/courses/1/exams").should route_to("exams#create", :course_id => "1")
    end

    it "routes to #update" do
      put("/courses/1/exams/2").should route_to("exams#update", :id => "2", :course_id => "1")
    end

    it "routes to #destroy" do
      delete("/courses/1/exams/2").should route_to("exams#destroy", :id => "2", :course_id => "1")
    end

  end
end
