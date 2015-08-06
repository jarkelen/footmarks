Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  resource :map, only: [:show]
  resources :footmarks
  resources :clubs, except: [:show]
  resources :leagues, except: [:show]
end
