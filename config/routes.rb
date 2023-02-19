Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :paparazzis do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:index]
end
