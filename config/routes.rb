Rails.application.routes.draw do
  devise_for :shops, controllers:{
    sessions:       'shops/sessions',
    passwords:      'shops/passwords',
    registrations:  'shops/registrations'
  }
  devise_for :users, controllers: {
    sessions:       'users/sessions',
    passwords:      'users/passwords',
    registrations:  'users/registrations'
  }
  root to: "messages#index"
  resources :messages
end
