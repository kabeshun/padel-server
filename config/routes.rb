Rails.application.routes.draw do
  root 'admin/home#index'
  namespace :admin do
    resources :home, only: %i[index show]
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :facilities, only: %i[index show]
      resources :users, only: %i[index show]
    end
  end
end
