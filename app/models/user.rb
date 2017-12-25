class User < ApplicationRecord
  # For some reason, this model gets loaded on the CLI which causes this to
  # explode.  I'll need to figure out where it's being loaded...
  audit :username, :email, :locked_at, :locked_for, :deleted_at rescue nil
  devise :database_authenticatable, :lockable, :registerable,
         :rememberable, :validatable,
         lock_strategy: :none,
         unlock_strategy: :none

  has_many :posts
  has_many :messages

  validates :rank, presence: true,
                   inclusion: { in: %w{ user moderator admin } }

  def rank
    ActiveSupport::StringInquirer.new(super)
  end
  delegate :user?, :moderator?, :admin?, to: :rank
end
