module Postable
  extend ActiveSupport::Concern

  included do
    audited
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

    scope :top_level, -> { where(parent: nil).with_replies }
    scope :thread_for, -> postable_id { where('id = :id OR parent_id = :id', id: postable_id) }
  end

  def top_level?
    parent_id.blank?
  end

  def edited?
    last_edit.present?
  end

  def edited_at
    last_edit.created_at
  end

  def edited_by
    last_edit.user
  end

  def deleted_by
    last_delete.user
  end

  private

  def last_edit
    @_last_edit ||= self.audits.where("jsonb_typeof(audited_changes->'body') = 'array'").last
  end

  def last_delete
    @_last_delete ||= self.audits.where(action: :destroy).last
  end
end
