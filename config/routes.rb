Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :histories, only: [:index, :create]
    resources :comments, only: :create
  end

  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items, only: :history do
    post 'history', on: :member
  end
end
