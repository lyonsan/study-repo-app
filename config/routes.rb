Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get "details", to: 'home#details'
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
  resources :users, only: [:index, :show] do
    collection do
      get 'search'
    end
    member do
      get 'library'
    end
  end
  resources :chats, only: [:create, :show, :destroy] do
    resources :messages, only: :create
  end
  resources :articles do
    member do
      post 'edit_confirm'
      post 'edit_back'
    end
    collection do
      post 'confirm'
      post 'back'
      get 'search'
      get 'tagsearch'
    end
    resource :likes, only: [:create, :destroy]
  end
end
