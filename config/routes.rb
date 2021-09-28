Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/top' => 'homes#top'

  get '/reservations' => 'reservations#index'
  get 'reservations/new'
  post 'reservations/confirm'
  post 'reservations/back'
  post 'reservations/complete'
  
  resources :users
  resources :posts
end
