# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:'zords#index'

  get 'zords', to: 'zords#index', as: 'zords'
  get 'zords/new', to: 'zords#new', as: 'new_zord'
  get 'zords/:id/edit', to: 'zords#edit', as: 'edit_zord'
  get 'zords/:id', to: 'zords#show', as: 'zord'
  post 'zords', to: 'zords#create'
  patch 'zords/:id', to: 'zords#update'
  delete 'zords/:id', to: 'zords#destroy'

  get 'cart', to: 'cart#index', as: 'cart'
  post 'zords/:id/add_to_cart', to: 'cart#add_to_cart', as: 'add_to_cart'
  get 'order/add_address', to: 'order#add_address', as: 'add_address'
  post 'create_address', to: 'order#create_address', as:'create_address'
  get 'order/add_payment', to: 'order#add_payment', as: 'add_payment'
  post 'create_payment', to: 'order#create_payment', as:'create_payment'

  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
