Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :users
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end
  resources :addresses
end
