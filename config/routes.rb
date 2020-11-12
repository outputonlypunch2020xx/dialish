Rails.application.routes.draw do
  get 'chart/index'
  devise_for :users
  root to: "diaries#index"

  resources :diaries do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
