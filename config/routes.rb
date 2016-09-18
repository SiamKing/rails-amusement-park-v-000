Rails.application.routes.draw do

  root 'users#home'
  get '/signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :attractions
  post 'rides/new' => 'rides#new'
end
