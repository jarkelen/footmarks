Rails.application.routes.draw do
  devise_for :users
  root 'footmarks#index'

  get "site/tickets"
  get "site/programmes"
  get "site/map"
  get "site/leagues_completed"
  get "site/visited_clubs"
  get "site/stats"

  resources :footmarks
  resources :clubs, except: [:show]
  resources :leagues, except: [:show]

  namespace :api, defaults: {format: 'json'} do
    resources :footmarks, only: [:index]
  end


end
