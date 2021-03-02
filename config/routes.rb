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
    resources :messages
  end
  namespace :users do
    resources :shops do
      resources :follow_requests, only: [:create, :destroy]
    end
  end

  namespace :shops do
    resources :shops do
      collection do
        get :search
      end
      resources :memberships
      post '/follow_requests/:id' => 'follow_requests#allow', as: 'allow'
      resources :follow_requests
    end
  end
  resources :messages, only:[:new]
  resources :users
  
  resources :reservations

  
end
