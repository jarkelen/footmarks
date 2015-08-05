Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  resources :footmarks
  resources :clubs, except: [:show]
  resources :leagues, except: [:show]
end
