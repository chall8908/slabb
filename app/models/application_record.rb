class ApplicationRecord < ActiveRecord::Base
  include ActiveAudit::Base
  paranoid

  self.abstract_class = true
end
