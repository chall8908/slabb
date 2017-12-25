ActiveAudit.configure do |config|
  config.storage_adapter = :active_record
  config.current_user_method = :current_user
  config.ignored_attributes = %w(created_at updated_at)
  #config.job_queue = :audits
  #config.delayed_auditing = false
  config.default_user = { id: 0, username: 'Anonymous', rank: 'User'}
  #config.extract_user_profile = lambda { |user| { id: user.id } }
end
