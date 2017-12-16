class Post < ApplicationRecord
  include Postable

  belongs_to :creator, class_name: 'User'
end
