class ApplicationRecord < ActiveRecord::Base
  paranoid

  self.abstract_class = true
end
