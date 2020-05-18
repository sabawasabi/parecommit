Rails.application.routes.draw do
  devise_for :users
  root "matchs#index"
  resources :targets, only: [:new, :create]
end