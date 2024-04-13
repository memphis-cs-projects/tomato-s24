# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:'home#show'
  get:'requests', to:'requests#all_requests', as:'requests_all_requests'
  get:'requests/new_customize_zord', to:'requests#new_customize_zord', as:'request_customize_zord'
  post 'requests', to: 'requests#create'
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
