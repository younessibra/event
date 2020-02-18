Rails.application.routes.draw do
 
  root 'events#index'
  devise_for :users
 
  resources :events, only: [:show, :new, :create, :index, :edit, :destroy] do
    resources :pictures, only: [:create]
  end
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :participations, only: [:new, :create, :index]
  resources :charges

  namespace :admin do
    root 'admin#index'
    resources :users, only: [:index]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
