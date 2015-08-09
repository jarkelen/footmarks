Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  get "site/tickets"
  get "site/programmes"
  get "site/map"

  resources :footmarks
  resources :clubs, except: [:show]
  resources :leagues, except: [:show]
end
