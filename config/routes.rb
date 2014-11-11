Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  get '/contact' => 'static_pages#contact'
  get '/signup' => 'users#new'
end
