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
      @models -= %w{Ability Nip Schedule AttendeeWorkshop AttendeeExposition Rating Role}
      @models.each do |m|
        if %{Event}.include? m
          can :manage, eval(m) do |object|
            object.branch_id == @user.role.branch_id
          end
        elsif %w{Activity Conference Diary Exhibitor Exposition FaceToFace Group Hour Offert MassiveLoad Room Sponsor SystemConfiguration Workshop}.include? m
          can :manage, eval(m) do |object|
            object.event.branch_id == @user.role.branch_id
          end
        elsif m == "User"
          can :edit, User, :id => @user.id
          can :update, User, :id => @user.id
          can :read, User, :id => @user.id
          can :delete, User, :id => @user.id
          can :destroy, User, :id => @user.id
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
