class UserMailer < ActionMailer::Base   
  helper :application # gives access to all helpers defined within `application_helper`.

  default :from => "admin@tilbalakecommunity.org.au"  

  def status_approved(user)
    @user = user
    mail :to => user.email, :subject=> "Your account has been activated"
  end
end
