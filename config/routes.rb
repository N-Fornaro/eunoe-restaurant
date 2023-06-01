# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    match '/404', to: 'errors#not_found', via: :all
    match '/500', to: 'errors#internal_server_error', via: :all
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    # Defines the root path route ("/")
    # root 'pages#soon'
    root 'pages#home'

    # Temporary homepage / Opening soon (or future maintenance page)
    # get '/soon', to: 'pages#soon', as: 'soon'

    # Pages routes
    get '/home', to: 'pages#home', as: 'home'
    get '/admin', to: 'pages#admin', as: 'admin'
    get '/restaurant', to: 'pages#restaurant', as: 'restaurant'
    get '/privatisation', to: 'privatisations#new', as: 'privatisation'

    # Privatisation routes
    resources :privatisations do
      collection do
        get 'list'
      end
    end

    # Bookings routes [TO PASS TO ADMIN MODULE WHEN READY FOR PRODUCTION]
    # https://api.rubyonrails.org/v7.0.4/classes/ActionDispatch/Routing/Mapper/Scoping.html#method-i-namespace
    # namespace :admin do
    resources :bookings do
      collection do
        get 'list'
      end
    end
    # end
    get '/bookings/:id/confirmation', to: 'bookings#confirmation', as: 'confirmation_booking'

    # Newsletters & Menu routes [TO PASS TO ADMIN MODULE WHEN READY FOR PRODUCTION]
    # https://api.rubyonrails.org/v7.0.4/classes/ActionDispatch/Routing/Mapper/Scoping.html#method-i-namespace
    # namespace :admin do
    resources :newsletters, only: %i[index new show update create destroy]
    devise_scope :user do
      resources :meals
    end
  end
end
