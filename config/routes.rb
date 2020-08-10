Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flights
  root to: 'flights#index'
  resources :bookings, only: [:new, :create, :index, :show]
  get '/your_bookings', to: 'bookings#user_bookings'
end
