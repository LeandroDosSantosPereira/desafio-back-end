Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations, only: %i[create]
      resources :users, only: %i[create]
      resources :entity_users, only: %i[create]
    end
  end
end
