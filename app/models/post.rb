class Post < ApplicationRecord
  include Postable

  belongs_to :creator, class_name: 'User', required: true

  scope :with_replies, -> { includes(replies: :creator) }

  # before_create :increment_parent
end
