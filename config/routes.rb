Rails.application.routes.draw do
  devise_for :users
  resources :issues, only: [:index, :new, :create, :show, :update]
  resources :magazines, only:[:show, :update, :new, :create]
  resources :crews, only: [:index, :create, :show, :edit]

  root 'issues#index'
  namespace :admin do
    resources :issues, only: [:index, :edit, :destroy]
    resources :magazines, only: [:index, :edit, :destroy]
    resource :crews, only: [:new]
  end
end
