Rails.application.routes.draw do
  
  root 'drinks#index'
  
  resources :devices

  resources :drinks

  resources :users
  
end
