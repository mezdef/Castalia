class UsersController < ApplicationController

  before_filter :authenticate_user! , :except => [:new, :resetpassword]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def resetpassword
  end

end
