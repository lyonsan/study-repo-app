Rails.application.routes.draw do
  get 'memos/index'
  get 'memos/new'
  get 'subjects/index'
  get 'subjects/new'
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :reports, only: [:index, :new, :create, :destroy]
  end
  resources :subjects, only: [:index, :new, :create] do
    resources :memos, only: [:index, :new, :create]
  end
end
