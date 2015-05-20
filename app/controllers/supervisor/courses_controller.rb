class Supervisor::CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def index
    @courses = Course.paginate page: params[:page]
  end
  
  def create
    @course = Course.new course_params
    if @course.save
      flash[:info] = t(:create_succes, model: :"Course")
      redirect_to [:supervisor, @course]
    else
      render "new"
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes(course_params)
      flash[:info] = t(:edit_succes, model: :"Course")
      redirect_to [:supervisor, @course]
    else
      render "edit"
    end
  end

  def show
    @course = Course.find params[:id]
    @subjects = @course.subjects
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:success] = t(:delete_succes, model: :"Course")
    redirect_to supervisor_courses_url
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :status, subject_ids: []
  end
end
