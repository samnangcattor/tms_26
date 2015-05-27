class AssignedCoursesController < ApplicationController
  def show
    @courses = current_user.courses
  end
end
