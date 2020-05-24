Rails.application.routes.draw do
  devise_for :users
  root "targets#index"
  resources :users,   only: [:edit, :update]
  resources :targets, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :matchs do
    collection do
      get 'match_target', to: 'matchs#match_target'
      get 'done',         to: 'matchs#done'
    end
  end
end