Rails.application.routes.draw do
  devise_for :users
  resources :issues, only: [:index, :new, :create, :show, :update]

  root 'issues#index'
  namespace :admin do
    resources :issues, only: [:index, :edit, :destroy]
  end
end
