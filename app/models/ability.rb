class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      cannot :manage, :all
    else
      if user.role == "admin"
        can :manage, :all
      else
        can [:index], Club
        can [:index], League
        can [:index], :dashboard
        can [:index, :show], Footmark
        can [:show], :map
        can [:show], :tickets
        can [:show], :programmes

        cannot [:create, :edit, :destroy], Club
        cannot [:create, :edit, :destroy], League
        cannot [:create, :edit, :destroy], Footmark
      end
    end
  end
end
