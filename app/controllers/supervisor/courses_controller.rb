class Supervisor::CoursesController < ApplicationController
  before_action :set_course, except: [:index, :new, :create]

  def index
    @courses = Course.paginate page: params[:page]
  end

  def show
    @subjects = @course.subjects
  end

  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new course_params
    if @course.save
      flash[:info] = t("flash.create_succes")
      redirect_to [:supervisor, @course]
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @course.update_attributes(course_params)
      flash[:info] = t("flash.update_succes")
      redirect_to [:supervisor, @course]
    else
      render "edit"
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t("flash.delete_succes")
    redirect_to supervisor_courses_url
  end

  private
  def set_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit :name, :description, :status, subject_ids: []
  end
end
