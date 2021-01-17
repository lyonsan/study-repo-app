Rails.application.routes.draw do
  get 'subjects/index'
  get 'subjects/new'
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :reports, only: [:index, :new, :create, :destroy]
  end
  resources :subjects, only: [:index, :new, :create]
end
