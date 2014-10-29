Rails.application.routes.draw do
  
  root 'drinks#index'
  
  resources :devices

  resources :drinks
  
  resources :users
  
  # API Routes
  namespace :api, constraints: {format: :json} do
    namespace :v1 do
      ## Users
      resources :users, only: :create
      match 'users/authenticate', to: 'users#authenticate', via: :post, as: 'user_authenticate'
  
      ## Drinks
      match 'drinks/sync', to: 'drinks#sync', via: :post, as: 'drink_sync'
    end
  end
  
end
