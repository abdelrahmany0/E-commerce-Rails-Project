Rails.application.routes.draw do
  get "carts/show", to: "carts#show"
  post "carts", to: "carts#add"
  patch "carts", to: "carts#update"
  delete "carts", to: "carts#destroy"
  put "carts", to: "carts#empty"

  resources :orders
  root to: "products#home"

  resources :coupons
  resources :stores
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products
  resources :brands
  resources :categories
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
