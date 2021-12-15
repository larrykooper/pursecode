Rails.application.routes.draw do
  root to: "orders#enter"

  resources :orders
  post '/orders.json', to: 'orders#create'
  post '/orders/:id.json', to: 'orders#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
