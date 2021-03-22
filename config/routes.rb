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

  root to: "users/posts#top"
  
  namespace :users do
    resources :users do
      resources :memberships, only: [:index,:destroy]
    end
    resources :shops do
      collection do
        get :search
      end
      resources :follow_requests, only: [:create, :destroy]
      resources :reservation_requests
    end
    resources :posts do
      collection do
        get 'search'
        get 'top'
      end
    end
    resources :reservations
  end

  namespace :shops do
    resources :posts do

    end
    resources :shops do
      resources :memberships
      post '/follow_requests/:id' => 'follow_requests#allow', as: 'allow'
      resources :follow_requests
      post '/reservation_requests/:id' => 'reservation_requests#reserve_allow', as: 'reserve_allow'
      resources :reservation_requests
      resources :users, only:[:index,:show]
    end
    resources :reservations
  end
  resources :messages, only:[:new]
  resources :users
end
