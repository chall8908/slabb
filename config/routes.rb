Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  devise_for :users, only: :sessions

  resources :posts do#, :messages
    member do
      put :restore
    end
  end
end
