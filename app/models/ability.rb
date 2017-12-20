class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    # Everyone can read posts
    can :read, Post

    if user
      # Can read and create messages where they are the sender
      can [:read, :create], Message, sender_id: user.id
      # Can read messages where they are the recipient
      can :read, Message, recipient_id: user.id
      # Can manage their own posts
      can :manage, Post, creator_id: user.id

      if user.admin?
        can :manage, :all
      elsif user.moderator?
        can :manage, Post
      end
    end
  end
end
