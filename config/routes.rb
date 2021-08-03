require 'sidekiq/web'
Rails.application.routes.draw do
  resources :reclamacaos do
    collection do
      get :search
    end
    member do
      get :close
      get :open
    end
  end

  resources :email_templates do
    member do
      get :open_template_modal
    end
  end
  
  resources :pubsubs

  resources :tinymce_images, only: %i(create show)

  post 'uploader/image', to: 'uploader#image'

  post 'pushsubscribe', to: 'pubsubs#pushsubscribe', as: 'pushsubscribe'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
end
