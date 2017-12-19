class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  prepend_view_path ActionView::FileSystemResolver.new(
                      # Views live in the frontend folder now
                      Rails.root.join('app', 'frontend'),
                      # This path allows us to use arbitrary sub-folders
                      ':prefix/{**/,}:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}'
                    )
end
