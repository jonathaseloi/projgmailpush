Rails.application.routes.draw do
  resources :pubsubs
  post 'pushsubscribe', to: 'pubsubs#pushsubscribe', as: 'pushsubscribe'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
