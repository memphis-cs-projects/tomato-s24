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


  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
