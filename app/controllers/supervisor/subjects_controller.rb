class Supervisor::SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t(:create_succes, model: :"Subject")
      redirect_to root_url
    else
      render "new"
    end   
  end
  
  private
  def subject_params
    params.require(:subject).permit :name, :description, :status , 
                                    tasks_attributes: [:id, :name, :description, 
                                                      :status, :_destroy]
  end
end
