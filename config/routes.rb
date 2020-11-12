Rails.application.routes.draw do
  get 'chart/index'
  devise_for :users
  root to: "diaries#index"

  resources :diaries do
    resource :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
