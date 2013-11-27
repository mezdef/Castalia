class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  # def edit
  #   @user = User.find(params[:id])
  #   super
  # end

  # def update
  #   super
  #   # if params[:user][:password].blank?
  #   #   params[:user].delete(:password)
  #   #   params[:user].delete(:password_confirmation)
  #   # end
  #   @user = User.find(params[:id])
  #   params[:user].delete(:password) if params[:user][:password].blank?
  #   params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
  #   if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :roles, :role_ids, :password, :password_confirmation))
  #     flash[:notice] = "Successfully updated User."
  #     redirect_to root_path
  #   else
  #     render :action => 'edit'
  #   end
  # end


end 
