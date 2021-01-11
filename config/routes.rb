Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :reports, only: [:index, :new, :create]
  end
end
