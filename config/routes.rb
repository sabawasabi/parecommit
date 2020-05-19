Rails.application.routes.draw do
  devise_for :users
  root "matchs#index"
  resources :users, only: [:edit, :update]
  resources :targets, only: [:new, :create]
end