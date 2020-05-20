Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/destroy'
  resources :users
  
  root to: 'users#show'
  
end
