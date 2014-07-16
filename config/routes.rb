Rails.application.routes.draw do
  devise_for :users
  resources :issues, only: [:index, :show]
  resources :magazines, only:[:show, :update, :new, :create]

  root 'issues#index'
  namespace :admin do
    resources :issues
    resources :magazines, only: [:index, :edit, :destroy]
    resources :crews
    resources :formats
    resources :languages
    resources :media
    resources :sizes
    resources :stitchings
    resources :countries
  end
end
