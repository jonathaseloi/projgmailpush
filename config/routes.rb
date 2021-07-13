require 'sidekiq/web'
Rails.application.routes.draw do
  resources :pubsubs
  resources :reclamacaos
  post 'pushsubscribe', to: 'pubsubs#pushsubscribe', as: 'pushsubscribe'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
end
