class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  # resourcify

  def active_for_authentication? 
    super && status == "approved"
  end 

  def inactive_message 
    if status == "pending"
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end


end
