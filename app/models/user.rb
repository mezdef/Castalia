class User < ActiveRecord::Base

  has_and_belongs_to_many :events

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


  after_create :account_requested
  def account_requested
    UserMailer.account_requested(self).deliver
    UserMailer.account_requested_admin(self).deliver
  end

  validates :email, :uniqueness => true


  def name
    first_name + ' ' + last_name
  end
end
