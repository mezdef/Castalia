class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # before_filter :configure_devise_params, if: :devise_controller?
  before_filter :last_page

  # def configure_devise_params
  #   devise_parameter_sanitizer.for(:sign_up) do |u|
  #     u.permit(:email, :password, :password_confirmation)
  #   end
  #   devise_parameter_sanitizer.for(:account_update) do |u|
  #     u.permit(:first_name, :last_name, :contact, :location, :roles, :status, :role_ids, :password, :password_confirmation, :current_password)
  #   end
  # end

 
  private
 
  def last_page
    session[:last_page] = request.env['HTTP_REFERER']
    #raise session[:last_page].inspect
  end
 

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
end
