Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: 'home#index'
  get 'home/help'
  get 'home/about'
end
