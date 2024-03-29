Rails.application.routes.draw do
  devise_for :admin_users, :controllers => {
    :registrations => 'admin_users/registrations',
    :sessions => 'admin_users/sessions'
  }
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', :controllers => {
    :registrations => 'api/v1/auth/registrations'
  }
  root 'admin/home#index'
  namespace :admin do
    resources :home, only: %i[index show]
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :facilities, only: %i[index show]
      resources :favorites do 
        collection do
          post 'set_favorite'
          post 'remove_favorite'
        end 
      end
      resources :users, only: %i[index show] do 
        collection do
          get 'me'
        end
      end
    end
  end
end
