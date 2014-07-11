Rails.application.routes.draw do
  devise_for :users
  resources :issues, only: [:index, :new, :create, :show, :update]
  resources :magazines, only:[:show, :update, :new, :create]

  root 'issues#index'
  namespace :admin do
    resources :issues, only: [:index, :edit, :destroy]
    resources :magazines, only: [:index, :edit, :destroy]
    resources :crews
    resources :formats, except: :delete
    resources :languages, except: :delete
    resources :media, except: :delete
    resources :sizes, except: :delete
    resources :stitchings, except: :delete
  end
end
