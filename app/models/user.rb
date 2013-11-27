class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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

  validates :email, :uniqueness => true
end
