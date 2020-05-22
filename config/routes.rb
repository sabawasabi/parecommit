Rails.application.routes.draw do
  devise_for :users
  root "targets#index"
  resources :users, only: [:edit, :update]
  resources :targets, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :matchs, only: [:new, :create]
end