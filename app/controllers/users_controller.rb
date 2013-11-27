class UsersController < ApplicationController

  before_filter :authenticate_user! , :except => [:new, :resetpassword]
  load_and_authorize_resource

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

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update

    @user = User.find(params[:id])

    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    # params[:user][:role_ids] ||= []

    # if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :status, :role, :role_ids, :password, :password_confirmation))
    if @user.update_attributes(user_params)
      # redirect_to user_path
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to @user
      flash[:notice] = "Successfully updated User."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  private
  def user_params
    if can? :manage, User
      # params[:user]
      params.require(:user).permit(:email, :first_name, :last_name, :contact, :status, :role, {:role_ids => []}, :password, :password_confirmation, )
    else
      params[:user].permit(:first_name, :last_name, :password, :password_confirmation)
    end
  end

end
