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
  resources :subjects, only: [:index, :new, :create, :destroy] do
    resources :memos do
      collection do
        get 'search'
      end
    end
  end
end
