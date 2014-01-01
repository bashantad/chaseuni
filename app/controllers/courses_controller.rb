class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :enroll]
  before_action :set_faculties, only: [:new, :edit, :update, :create]
  
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all #.paginate(:page => params[:page], :per_page => 10)
    @faculties = Faculty.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @isEnrolled = Enrollment.isEnrolled(current_user, @course)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  def enroll
    if Enrollment.isEnrolled(current_user, @course)
      redirect_to courses_path, alert: 'You have already enrolled in this course.'
    else
      current_user.enrollments.create(:course_id => @course.id)
      redirect_to courses_path, notice: 'You have successfully enrolled in the course.'
    end
  end

  def enrollments
    @courses = current_user.courses
    @results = current_user.results
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
    
    def set_faculties
      @faculties = Faculty.get_key_values
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :level, :faculty_id)
    end
end
