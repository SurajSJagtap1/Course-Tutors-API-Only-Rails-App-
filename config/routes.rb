require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :courses, only: [:create, :index]
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
end
