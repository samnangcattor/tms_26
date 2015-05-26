class Supervisor::SubjectsController < ApplicationController
  before_action :set_subject, except: [:index, :new, :create]

  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t("flash.create_succes")
      redirect_to [:supervisor, @subject]
    else
      render "new"
    end   
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:info] = t("flash.edit_succes")
      redirect_to [:supervisor, @subject]
    else
      render "edit"
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = t("flash.delete_succes")
    redirect_to [:supervisor, @subject]
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description, :status, 
      tasks_attributes: [:id, :name, :description, :status, :_destroy]
  end

  def set_subject
    @subject = Subject.find params[:id]
  end
end
