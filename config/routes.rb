# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  # Pages routes
  get '/home', to: 'pages#home', as: 'home'
  get '/restaurant', to: 'pages#restaurant', as: 'restaurant'
  get '/privatisation', to: 'pages#privatisation', as: 'privatisation'

  # Bookings routes [TO PASS TO ADMIN MODULE WHEN READY FOR PRODUCTION]
  # https://api.rubyonrails.org/v7.0.4/classes/ActionDispatch/Routing/Mapper/Scoping.html#method-i-namespace
  # namespace :admin do
  resources :bookings
  # end
  get '/bookings/:id/confirmation', to: 'bookings#confirmation', as: 'confirmation_booking'

  # Newsletters & Menu routes [TO PASS TO ADMIN MODULE WHEN READY FOR PRODUCTION]
  # https://api.rubyonrails.org/v7.0.4/classes/ActionDispatch/Routing/Mapper/Scoping.html#method-i-namespace
  # namespace :admin do
  resources :newsletters, only: %i[index new show update create destroy]
  resources :meals
  # end
end
