Rails.application.routes.draw do
  
  root 'drinks#index'

  resources :admins

  resources :sessions
  
  resources :devices

  resources :drinks
  
  resources :users
  
  # API Routes
  namespace :api do
    namespace :v1 do
      ## Users
      resources :users, only: :create
      match 'users/authenticate', to: 'users#authenticate', via: :post, as: 'user_authenticate'
      match 'me', to: 'users#me', via: :get, as: 'me'
  
      ## Drinks
      resources :drinks, only: [:create, :index]
      match 'drinks/sync', to: 'drinks#sync', via: :post, as: 'drink_sync'
    end
  end
  
end
