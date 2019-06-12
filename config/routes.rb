Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root to: 'home#index'
  resources :posts, expect: :show
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only:[:create,:destroy]
  resources :likes, only: [:create, :destroy]
end
