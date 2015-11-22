class LessonsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET courses/:course_id/lessons
  # GET courses/:course_id/lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET courses/:course_id/lessons/1
  # GET courses/:course_id/lessons/1.json
  def show
  end

  # GET courses/:course_id/lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET courses/:course_id/lessons/1/edit
  def edit
  end

  # POST courses/:course_id/lessons
  # POST courses/:course_id/lessons.json
  def create
    puts lesson_params
    @lesson = Lesson.new(lesson_params)
    @lesson.course_id = @course.id
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to [@course, @lesson], notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT courses/:course_id/lessons/1
  # PATCH/PUT courses/:course_id/lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to [@course, @lesson], notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE courses/:course_id/lessons/1
  # DELETE courses/:course_id/lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to course_lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end
    
    def set_course
      @course = Course.find(params[:course_id])    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :body, :complete)
    end
end
