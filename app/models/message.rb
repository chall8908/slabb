class Message < ApplicationRecord
  include Postable

  belongs_to :sender, class_name: 'User', required: true
  belongs_to :recipient, class_name: 'User', required: true

  scope :relates_to, lambda { |user| where('"sender_id" = :id OR "recipient_id" = :id', id: user.id) }

  scope :with_replies, -> { includes(replies: [:sender, :recipient]) }
end
