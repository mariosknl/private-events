Rails.application.routes.draw do
  resources :users
  
  root to: 'users#show'
  
end
