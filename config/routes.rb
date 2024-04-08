# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:'zords#index'

  get 'zords', to: 'zords#index', as: 'zords'

  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
