# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

 root to:'zords#index'

  get 'zords', to: 'zords#index', as: 'zords'
  get 'zords/new', to: 'zords#new', as: 'new_zord'

  get 'zords/new_limited', to: 'zords#new_limited', as: 'new_limited'

  get 'zords/:id/edit', to: 'zords#edit', as: 'edit_zord'
  get 'zords/:id', to: 'zords#show', as: 'zord'
  post 'zords', to: 'zords#create'
  patch 'zords/:id', to: 'zords#update'
  delete 'zords/:id', to: 'zords#destroy'

  get 'bids', to: 'bids#index', as: 'all_bids'
  get 'bids/:zord_id/new_bid', to:'bids#add_bid', as: 'new_bid'
  post 'bids/:zord_id', to:'bids#create_bid', as: 'create_bid'
  delete 'bids/:bid_id', to: 'bids#destroy', as: 'bid'
  get 'bids/:bid_id', to: 'bids#show_zord_bid', as: 'show_zord_bid'
  post 'bids/register/:bid_id', to:'bids#create_registration', as: 'register'
  delete 'bids/registration/:bid_id', to: 'bids#destroy_registration', as: 'destroy_registration'



  get 'cart', to: 'cart#index', as: 'cart'
  post 'zords/:id/add_to_cart', to: 'cart#add_to_cart', as: 'add_to_cart'
  delete 'cart_items/:id/remove_from_cart', to: 'cart#remove_from_cart', as: 'remove_from_cart'

  get 'order/add_address', to: 'order#add_address', as: 'add_address'
  post 'create_address', to: 'order#create_address', as:'create_address'
  get 'order/add_payment', to: 'order#add_payment', as: 'add_payment'
  post 'create_payment', to: 'order#create_payment', as:'create_payment'



 get:'requests', to:'requests#all_requests', as:'requests_all_requests'
 get:'requests/new_customize_zord', to:'requests#new_customize_zord', as:'request_customize_zord'
 get 'requests/:id/edit_request', to: 'requests#edit', as: 'edit_request'
 post 'requests', to: 'requests#create_new_zord'
 get 'requests/:id', to: 'requests#show', as: 'request'
 patch 'requests/:id', to: 'requests#update_customize_zord'
 delete 'requests/:id', to: 'requests#destroy'

  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
