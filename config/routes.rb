Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/dashboard", to: "pages#dashboard"
  delete "/bookings/:id", to: "bookings#destroy", as: :delete_booking
  delete "/users/:id", to: "users#destroy", as: :delete_user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :paparazzis do
    resources :bookings, only: :show
  end

  resources :bookings, only: %i[new create index] do
    resources :reviews, only: %i[new create]
  end
end
