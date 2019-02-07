Rails.application.routes.draw do
  root to: 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome(/:first_name)', to: 'static_pages#welcome'

  resources :gossips do
    resources :comments, only: [:create]
  end

  resources :comments, except: [:index, :show] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show]
  
  resources :cities, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
