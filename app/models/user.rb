class User < ApplicationRecord
  devise :database_authenticatable, :lockable, :registerable,
         :rememberable, :validatable,
         lock_strategy: :none,
         unlock_strategy: :none

  audited only: [:email, :username, :rank, :locked_at, :locked_for],
          associated_with: [:posts, :messages]

  has_many :posts
  has_many :messages

  validates :rank, presence: true,
                   inclusion: { in: %w{ user moderator admin } }

  def rank
    ActiveSupport::StringInquirer.new(super)
  end
  delegate :user?, :moderator?, :admin?, to: :rank
end
