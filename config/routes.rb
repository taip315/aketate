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
  resource :messages, only:[:new]
  resources :users, only: [:index,:show]
  resources :shops, only: [:index, :show] do
    collection do
      get :search
    end
  end
end
