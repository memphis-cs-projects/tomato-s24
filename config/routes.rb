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

  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
