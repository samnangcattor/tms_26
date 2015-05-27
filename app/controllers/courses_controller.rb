class CoursesController < ApplicationController
  def show
    @course = Course.find params[:id]
    @activities = current_user.activities.course_activities @course.id
  end
end
