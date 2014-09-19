Rails.application.routes.draw do
  devise_for :users
  resources :issues, only: [:index, :show]
  resources :magazines, only:[:show, :update, :new, :create]
  resources :contact_forms, only:[:new, :create]

  root 'home#index'
  namespace :admin do
    resources :issues do
       get :autocomplete_magazine_title, :on => :collection
    end
    resources :magazines, only: [:index, :edit, :destroy]
    resources :crews
    resources :formats
    resources :languages
    resources :media
    resources :sizes
    resources :stitchings
    resources :countries
  end

  get "*any", via: :all, to: "errors#not_found"
end
