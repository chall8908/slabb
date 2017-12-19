class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Views live in the frontend folder now
  prepend_view_path Rails.root.join('app', 'frontend')
end
