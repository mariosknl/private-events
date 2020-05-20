Rails.application.routes.draw do
  resources :events
  get 'sessions/new'
  get 'sessions/destroy'
  resources :users
  
  root to: 'users#index'
  
end
