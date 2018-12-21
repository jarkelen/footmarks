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
        can [:view], :map
        can [:view], :tickets
        can [:view], :programmes
        can [:view], :leagues_completed
        can [:view], :stats

        cannot [:create, :edit, :destroy], Club
        cannot [:create, :edit, :destroy], League
        cannot [:create, :edit, :destroy], Footmark
        cannot [:create, :edit, :destroy], Photo
      end
    end
  end
end
