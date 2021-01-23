Rails.application.routes.draw do
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
  resources :users, only: [:index, :show]
end
