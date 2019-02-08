Rails.application.routes.draw do
  root to: 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome(/:first_name)', to: 'static_pages#welcome'

  resources :gossips do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :comments, except: [:index, :show] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show, :new, :create]
  
  resources :cities, only: [:show]

  resources :sessions, only: [:create, :new, :destroy]

  resources :conversations, only: [:index, :new, :create,:show] do 
    resources :private_messages, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
