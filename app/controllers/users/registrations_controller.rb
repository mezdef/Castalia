class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def edit
    super
  end

  def update
    super
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end


end 
