Rails.application.routes.draw do
  devise_for :users
  resources :movements, only: [:index, :new, :create, :destroy]

  root "movements#index"
end
