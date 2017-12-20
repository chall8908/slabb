class User < ApplicationRecord
  devise :database_authenticatable, :lockable, :registerable,
         :rememberable, :validatable,
         lock_strategy: :none,
         unlock_strategy: :none

  has_many :posts
  has_many :messages

  def rank
    ActiveSupport::StringInquirer.new(super)
  end
  delegate :user?, :moderator?, :admin?, to: :rank
end
