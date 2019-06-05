Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/help'
  get 'home/about'
end
