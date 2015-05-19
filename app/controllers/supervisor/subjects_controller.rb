class Supervisor::SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end
end
