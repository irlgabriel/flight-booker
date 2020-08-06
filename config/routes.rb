Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flights
  root to: 'flights#index'
  resources :bookings, only: [:new, :create, :index]
end
