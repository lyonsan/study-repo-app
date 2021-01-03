Rails.application.routes.draw do
  root to: "rooms#index"
  resources :items, only: :index
end
