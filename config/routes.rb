Rails.application.routes.draw do
  resources :posts, expect: [:show]
  devise_for :users
  root to: 'home#index'
  get 'home/help'
  get 'home/about'
  resources :users, only: [:index, :show]
end
