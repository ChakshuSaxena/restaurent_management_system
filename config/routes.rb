Rails.application.routes.draw do
  root "users#index"

  resources :users
  resources :restaurants
  resources :orders
  resources :menus
  resources :menu_items
end

