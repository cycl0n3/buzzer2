Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      unlocks: 'users/unlocks',
  }

  resources :users

  resources :articles
end
