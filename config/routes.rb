Rails.application.routes.draw do
  get 'chart/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "diaries#index"

  resources :diaries do
    resource :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
