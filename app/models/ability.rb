class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    alias_action :restore, to: :delete

    # Everyone can read posts
    can :read, Post

    if user
      # Users can read other users
      can :read, User
      # Users can update themselves
      can :update, User, id: user.id
      # Can read and create messages where they are the sender
      can [:read, :create], Message, sender_id: user.id
      # Can read messages where they are the recipient
      can :read, Message, recipient_id: user.id
      # Be specific here to prevent users seeing their own deleted posts
      can [:create, :update, :delete], Post, creator_id: user.id

      if user.admin?
        can :manage, :all
        can :see_deleted, :all
      elsif user.moderator?
        can [:manage, :see_deleted], Post
      end
    end
  end
end
