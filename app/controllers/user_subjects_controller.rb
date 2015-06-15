class UserSubjectsController < ApplicationController
  def create
    @subject = Subject.find params[:subject_id]
    current_user.training @subject
    respond_to do |format|
      format.html {redirect @subject}
      format.js
    end
  end

  def update
    @subject = UserSubject.find params[:id]
    if @subject.update_attributes usersubject_param 
      respond_to do |format|
        format.html {redirect @subject}
        format.js
      end
    end
  end

  private
  def usersubject_param
    params.require(:user_subject).permit :status
  end
end
