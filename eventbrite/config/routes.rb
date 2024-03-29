Rails.application.routes.draw do

  root 'events#index'

  devise_for :users, :controllers => { :sessions => "sessions"}

  resources :users
  resources :events

  resources :users do
    resources :attendances
  end

  resources :events do
    resources :attendances
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
