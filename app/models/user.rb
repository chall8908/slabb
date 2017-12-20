class User < ApplicationRecord
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
