Rails.application.routes.draw do
  devise_for :users
  root "targets#index"
  resources :targets, only: [:new, :create, :show]
  resources :matchs, only: [:index, :new, :create]
  resources :users, only: [:edit, :update]
end