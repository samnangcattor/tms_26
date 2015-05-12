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

  private
  def course_params
    params.require(:course).permit :name, :description, :status
  end
end
