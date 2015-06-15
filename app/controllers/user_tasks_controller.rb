class UserTasksController < ApplicationController
  def create
    @task = Task.find params[:task_id]
    current_user.training @task
    respond_to do |format|
      format.html {redirect @task}
      format.js
    end
  end

  def update
    @task = UserTask.find params[:id]
    if @task.update_attributes usertask_param 
      respond_to do |format|
        format.html {redirect @task}
        format.js
      end
    end
  end

  private
  def usertask_param
    params.require(:user_task).permit :status
  end
end
