module Postable
  extend ActiveSupport::Concern

  included do
    belongs_to :parent, { class_name: self.to_s,
                          required: false,
                          foreign_key: 'parent_id'
                        }
    has_many :replies, { class_name: self.to_s,
                         inverse_of: :parent,
                         foreign_key: 'parent_id',
                         dependent: :destroy
                       }

    validates :body, presence: true

    scope :with_replies, -> { includes(:replies) }
    scope :top_level, -> { where(parent: nil) }
  end
end
