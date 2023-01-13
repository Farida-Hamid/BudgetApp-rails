class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    
    can :read, :all
    can :manage, Group, author_id: user.id
    can :manage, Payment, author_id: user.id
  end
end
