class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]

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

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user 
  end
end
