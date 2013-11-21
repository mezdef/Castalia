class UsersController < ApplicationController

  before_filter :authenticate_user! , :except => [:new, :resetpassword]
  # load_and_authorize_resource

  def index
    @approveduser = User.find_all_by_status("approved")
    @pendinguser = User.find_all_by_status("pending")
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  #   # redirect_to root_url
  end

  def resetpassword
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation))
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

end
