class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :set_exam_types, only: [:new, :create, :edit, :update]
  #before_filter :set_layout
  # GET /exams
  # GET /exams.json
  def index
    @course = Course.find(params[:course_id])
    @exams = @course.exams    
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Course.find(params[:course_id]).exams.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = current_user.exams.new(exam_params)
    respond_to do |format|
      if @exam.save
        format.html { redirect_to course_exams_url(@exam.course_id), notice: 'Exam was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exam }
      else
        format.html { render action: 'new' }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to course_exams_url(@exam.course_id), notice: 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to course_exams_url(@exam.course_id) }
      format.json { head :no_content }
    end
  end

  private
    def set_layout
      if params[:action] == "edit" || "new"
        render :layout => "modal"
      else
        layout "application"
      end
    end
    
    def set_exam_types 
      @exam_types = { "Subjective" => "Subjective", "Objective" => "Objective"}
      @exam_levels = {"Beginner" => "Beginner", "intermediate" => "intermediate", "Advanced" => "Advanced"}
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name, :exam_type, :difficulty_level, :course_id, :full_mark, :no_of_questions)
    end
end
