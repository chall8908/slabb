module Postable
  extend ActiveSupport::Concern

  included do
    belongs_to :reply_to, class_name: self.to_s, required: false
    has_many :replies, { class_name: self.to_s,
                         inverse_of: :reply_to,
                         dependent: :destroy
                       }
  end
end
