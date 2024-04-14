# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

 root to:'zords#index'

 get 'zords', to: 'zords#index', as: 'zords'
 get 'zords/new', to: 'zords#new', as: 'new_zord'
 post 'zords', to: 'zords#create'

 get:'requests', to:'requests#all_requests', as:'requests_all_requests'
 get:'requests/new_customize_zord', to:'requests#new_customize_zord', as:'request_customize_zord'
 get 'requests/:id', to: 'requests#show', as: 'request'
 get 'requests/:id/edit_request', to: 'requests#edit', as: 'edit_request'
 post 'requests', to: 'requests#create_new_zord'
 patch 'requests/:id', to: 'requests#update_customize_zord'
 delete 'requests/:id', to: 'requests#destroy'
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
