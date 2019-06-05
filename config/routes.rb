Rails.application.routes.draw do
  get 'home/index'
  get 'home/help'
  get 'home/about'
  root to: 'application#hello'
end
