class User < ApplicationRecord
  devise :database_authenticatable, :lockable, :registerable,
         :rememberable, :validatable,
         lock_strategy: :none,
         unlock_strategy: :none

  has_many :posts
  has_many :messages
end
