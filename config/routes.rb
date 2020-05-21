Rails.application.routes.draw do
  get 'invitations/create'
  get 'invitations/new'
  resources :events
  get 'sessions/new'
  get 'sessions/destroy'
  resources :users
  
  root to: 'users#index'
  
end
