class Supervisor::UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user,  only: [:new, :destroy, :edit]

  def new
   @user = User.new
  end
  
  def index
    @users = User.paginate page: params[:page]
  end

  def create
   @user = User.new user_params
   if @user.save
     flash[:info] = t(:create_succes, model: :"User")
     redirect_to root_url
   else
     render "new"
   end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(user_params)
      flash[:success] = t(:label, label: "Profile updated")
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = t(:label, label: :"User Delete")
    redirect_to request.referrer || root_url 
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t(:label, label: :"Please log in.")
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to root_url unless current_user.isSupervisor?
  end
end
