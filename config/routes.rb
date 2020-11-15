Rails.application.routes.draw do
  root to: "diaries#index"
  get 'chart/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  

  resources :diaries do
    resource :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
