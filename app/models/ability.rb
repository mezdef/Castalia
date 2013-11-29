class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    end
    if user.has_role? :user
      can [:read, :update], User do |account|
        account.email == user.email
      end
    end
    if user.role.nil?
      can :read, :new
    end
  end

end
