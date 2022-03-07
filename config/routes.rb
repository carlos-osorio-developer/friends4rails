Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :users, only: [:index, :show] do
    resources :friendships, only: [:create, :destroy]
  end

  #use patch instead of put to update only :accepted attribute
  patch 'friendships/:id/accept/', to: 'friendships#accept', as: 'accept_friendship'
end
