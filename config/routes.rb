Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flights
  get 'search', to: 'search', controller: 'flights'
  root to: 'flights#index'
end
