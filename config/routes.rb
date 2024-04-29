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
  get 'bids/:bid_id/addBid', to: 'bids#add_user_bid', as: 'add_user_bid'
  post 'bids/:bid_id/UpdateBid', to:'bids#update_bid', as: 'update_bid'
  delete 'bids/registration/:bid_id', to: 'bids#destroy_registration', as: 'destroy_registration'

  get 'cart', to: 'cart#index', as: 'cart'
  post 'zords/:id/add_to_cart', to: 'cart#add_to_cart', as: 'add_to_cart'
  delete 'cart_items/:id/remove_from_cart', to: 'cart#remove_from_cart', as: 'remove_from_cart'

  get 'orders', to: 'orders#index', as: 'orders'
  get 'orders/:id', to: 'orders#show', as: 'order'

  get 'order/address', to: 'orders#address', as: 'address'
  post 'create_address', to: 'orders#create_address', as:'create_address'
  get 'order/payment', to: 'orders#payment', as: 'payment'
  post 'create_payment', to: 'orders#create_payment', as:'create_payment'
  get 'order/checkout', to: 'orders#checkout', as: 'checkout'
  get 'order/:id/review', to: 'orders#review', as: 'review'
  get 'order/:id/place', to: 'orders#place', as: 'place'

 get 'requests', to:'requests#all_requests', as:'requests_all_requests'
 get 'requests/new_customize_zord', to:'requests#new_customize_zord', as:'request_customize_zord'
 get 'requests/vendor_requests', to:'requests#vendor_requests', as:'requests_vendor_requests'
 get 'requests/:id/edit_request', to: 'requests#edit', as: 'edit_request'
 post 'requests', to: 'requests#create_new_zord'
 get 'requests/:id', to: 'requests#show', as: 'request'
 patch 'requests/:id', to: 'requests#update_customize_zord'
 delete 'requests/:id', to: 'requests#destroy'
 get 'requests/:id/approval', to: 'requests#approval', as: 'approval_request'
 patch 'requests/:id/approval', to: 'requests#decision_approval_request'
 get 'requests/:id/reject', to: 'requests#reject', as: 'reject_request'
 patch 'requests/:id/reject', to: 'requests#decision_reject_request'
 get 'notifications', to:'notifications#all_notifications', as: 'all_notifications'
 get 'notifications/:id', to: 'notifications#show_notification', as: 'notification'
 get 'reviews', to: 'reviews#all_reviews', as: 'all_reviews'
 get 'reviews/new_review', to: 'reviews#new_review', as: 'review_new'
 post 'reviews', to: 'reviews#create_new_review', as: 'create_new_review'
 post 'winner/send_notification/:bid_id', to: 'notifications#winner_notification', as: 'winner_notification'
 
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
