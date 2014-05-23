class Users::RegistrationsController < Devise::RegistrationsController

  def new
    # super
    @user = User.new(params[:user])
  end

  def create
    @user = User.new(params[:registration_params])
    @user.add_role(:user)

    if @user.save
      # UserMailer.account_requested(@user).deliver
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render 'new'
    end
  end


  private
  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  #   if can? :manage, User
  #     # params[:user]
  #     params.require(:user).permit(:email, :first_name, :last_name, :contact, :status, :role, {:role_ids => []}, :password, :password_confirmation )
  #   else
  #   end
  # end

end 
