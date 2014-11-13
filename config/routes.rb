Rails.application.routes.draw do
  get 'sessions/new'

  resources :users, only: [:new, :create]

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  get '/contact' => 'static_pages#contact'
  get '/signup' => 'users#new'
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
