Rails.application.routes.draw do
  
  root 'drinks#index'
  
  resources :devices

  resources :drinks
  
  resources :users, only: :index
  
  # API Routes
  resources :users, only: :create defaults: {format: :json}
  match 'users/authenticate', to: 'users#authenticate', via: :post, as: 'user_authenticate', defaults: {format: :json}
  
end
