Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :facilities, only: %i[index show]
      resources :users, only: %i[index show]
    end
  end
end
