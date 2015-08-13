Rails.application.routes.draw do
  devise_for :users
  root 'footmarks#index'

  get "site/tickets"
  get "site/programmes"
  get "site/map"
  get "site/leagues_completed"

  resources :footmarks
  resources :clubs, except: [:show]
  resources :leagues, except: [:show]
end
