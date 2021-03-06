# frozen_string_literal: true

Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root to: 'home#index'
  resources :posts
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
end
