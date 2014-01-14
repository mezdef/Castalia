class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :contributor
      can :manage, Text
    elsif user.has_role? :user
      can :read, :all
      can :update, User, :id => user.id
      # can
    elsif user.role.nil?
      can :read, :new
    end
  end

end
