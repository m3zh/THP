Rails.application.routes.draw do
  root 'static#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  #get '/welcome', to: 'static#welcome'
  #post '/welcome', to: 'static#welcome'
  get 'logout', to: 'sessions#destroy', via: 'delete'
  get 'profile', to: 'users#show'

  resources :gossips
  resources :users
  resources :cities, only: [:index, :show]
  resources :sessions, only: [:new,:create,:destroy]

  resources :gossips do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
