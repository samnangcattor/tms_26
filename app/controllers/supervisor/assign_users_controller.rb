class Supervisor::AssignUsersController < ApplicationController
  before_action :set_course, only: [:show, :update]

  def show
  end

  def update
    if @course.update_attributes course_params
      flash[:sucess] = t("flash.already_added")
      redirect_to request.referrer || root_url
    else
      redirect_to request.referrer || root_url
    end
  end

  private
  def set_course
    @course = Course.find params[:course_id] 
  end

  def course_params
    params.require(:course).permit user_ids: []
  end
end
