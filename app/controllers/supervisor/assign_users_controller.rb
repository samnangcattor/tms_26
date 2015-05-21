class Supervisor::AssignUsersController < ApplicationController
  def show
    @course = Course.find params[:course_id]
  end

  def update
    @course = Course.find params[:course_id]
    if @course.update_attributes course_params
      flash[:sucess] = t(:label, label: :"Course is updated")
      redirect_to request.referrer || root_url
    else
      redirect_to request.referrer || root_url
    end
  end

  private
  def course_params
    params.require(:course).permit user_ids: []
  end
end
