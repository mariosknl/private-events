Rails.application.routes.draw do

  resources :invitations, only: [:new, :create]
  resources :events
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  root to: 'events#index'

end
