class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    @user = User.find_by_id(user.id)
    if @user && @user.role.is_super_admin
      can :manage, :all
      cannot :new, SystemConfiguration
      cannot :create, SystemConfiguration
      cannot :delete, SystemConfiguration
      cannot :destroy, SystemConfiguration
      cannot :edit, MassiveLoad
      cannot :update, MassiveLoad
    elsif @user && !@user.role.is_super_admin
      @models = Dir['app/models/*.rb'].map { |f| File.basename(f, '.*').camelize.constantize.name }
      @models -= %w{Ability Nip Schedule Hour AttendeeWorkshop AttendeeExposition Rating Role}
      @models.each do |m|
        if m == "User"
          can :edit, User, :id => @user.id
          can :update, User, :id => @user.id
          can :read, User, :id => @user.id
          can :delete, User, :id => @user.id
          can :destroy, User, :id => @user.id
          cannot :new, User
          cannot :create, User
        else
          can :manage, eval(m)
        end
      end
      cannot :new, SystemConfiguration
      cannot :create, SystemConfiguration
      cannot :delete, SystemConfiguration
      cannot :destroy, SystemConfiguration
      cannot :edit, MassiveLoad
      cannot :update, MassiveLoad
    end

    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
