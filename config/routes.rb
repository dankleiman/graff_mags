Rails.application.routes.draw do
  devise_for :users
  resources :issues, only: [:index, :new, :create, :show, :update]
  resources :magazines, only:[:show, :update, :new, :create]

  root 'issues#index'
  namespace :admin do
    resources :issues, only: [:index, :edit, :destroy]
    resources :magazines, only: [:index, :edit, :destroy]
    resources :crews
    resources :formats
    resources :languages
    resources :media
    resources :sizes
    resources :stitchings
  end
  namespace :api do
    namespace :v1 do
      resources :issues
    end
  end
get '*path', to: 'issues#index'
end


