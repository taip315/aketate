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

  root to: "rooms#index"
  resources :rooms do
    collection do
      get :index2
    end
    resources :messages
  end

  resource :messages, only:[:new]
  resources :users
  resources :shops do
    collection do
      get :search
    end
  end
  resources :reservations

  namespace :user do
    
  end
end
