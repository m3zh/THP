Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, path: "mon_compte"

  resources :carts, path: "mon_panier"
  resources :items, path: "produits" do
    resources :photos, only: [:new, :create]
  end

  resources :users, path: "mon_compte" do
     resources :orders, path: "mes_commandes"
  end

  namespace :superuser do
    root 'dashboard#index'
    resources :orders, :items
  end

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
