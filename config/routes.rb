Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  # Pages routes
  get '/home', to: 'pages#home', as: 'home'
  get '/restaurant', to: 'pages#restaurant', as: 'restaurant'
  get '/cuisine', to: 'pages#cuisine', as: 'cuisine'

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
  resources :menus, only: %i[index new show update create destroy]
  # end
end
