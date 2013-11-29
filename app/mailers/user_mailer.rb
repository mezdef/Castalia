class UserMailer < ActionMailer::Base   
  helper :application # gives access to all helpers defined within `application_helper`.

  default :to => Proc.new { User.includes(:roles).where(roles: {name: "admin"}).map(&:email) }
    # @admin = User.includes(:roles).where(roles: {name: "admin"})
  default :from => "admin@tilbalakecommunity.org.au"  

  def account_requested(user)
    @user = user
    mail :to => user.email,
      :subject => "TLC Account request recieved succesfully",
      :template_path => 'users/mailer'
  end

  def account_requested_admin(user)
    @user = user
    mail :subject => "New TLC Account request for #{@user.email}",
      :template_path => 'users/mailer'
  end

  def status_approved(user)
    @user = user
    mail :to => user.email, :subject=> "Your account has been activated"
  end
end
