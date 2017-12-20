module Postable
  extend ActiveSupport::Concern

  included do
    belongs_to :reply_to, class_name: self.to_s, required: false
    has_many :replies, { class_name: self.to_s,
                         inverse_of: :reply_to,
                         dependent: :destroy
                       }

    scope :with_replies, -> { includes(:replies) }
    scope :top_level, -> { where(reply_to: nil) }
  end
end
