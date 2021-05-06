Rails.application.routes.draw do
  devise_for :shops, controllers: {
    sessions: 'shops/sessions',
    passwords: 'shops/passwords',
    registrations: 'shops/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'users/posts#top'

  namespace :users do
    resources :users do
      resources :memberships, only: %i[index destroy]
    end
    resources :shops do
      collection do
        get :search
      end
      resources :follow_requests, only: %i[create destroy] do
        collection do
          get 'done'
        end
      end
      resources :reservation_requests do
        collection do
          get 'done'
        end
      end
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
      collection do
        get 'done'
      end
    end
    resources :shops do
      resources :memberships
      post '/follow_requests/:id' => 'follow_requests#allow', as: 'allow'
      resources :follow_requests do
        collection do
          get 'done'
        end
      end
      post '/reservation_requests/:id' => 'reservation_requests#reserve_allow', as: 'reserve_allow'
      resources :reservation_requests do
        collection do
          get 'done'
        end
      end
    end
    resources :users, only: %i[index show]
    resources :reservations
  end
  resources :messages, only: [:new]
  resources :users
end
