class Message < ApplicationRecord
  include Postable

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  scope :relates_to, proc { |user| where('"sender_id" = :id OR "recipient_id" = :id', id: user.id) }
end
