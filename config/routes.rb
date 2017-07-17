Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'

  get '', to: 'sessions#index'
  get 'login', to: 'sessions#new', as: 'new_session'
  post 'login', to: 'sessions#create', as: 'create_session'
  get 'logout', to: 'sessions#destroy', as: 'destroy_session'

  resources :users, except: [:index]

  resources :leagues do
  	resources :players
  end
end
