Rails.application.routes.draw do
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#welcome'
  get 'gossip/:id', to: 'static_pages#gossip'
  get 'user/:id', to: 'static_pages#user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
