class Supervisor::CoursesController < ApplicationController
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new course_params
    if @course.save
      flash[:info] = t(:create_succes, model: :"Course")
      redirect_to root_url
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
      redirect_to root_url
    else
      render "edit"
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :status
  end
end
