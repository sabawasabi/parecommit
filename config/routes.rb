Rails.application.routes.draw do
  get 'matchs/index'
  devise_for :users
  root "matchs#index"
end
