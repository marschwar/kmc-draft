Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'

  get '', to: 'sessions#index'
  get 'login', to: 'sessions#new', as: 'new_session'
  post 'login', to: 'sessions#create', as: 'create_session'
  get 'logout', to: 'sessions#destroy', as: 'destroy_session'

  resources :users, except: [:index]
  resources :teams, except: [:destroy]

  resources :leagues do
    resources :users, controller: 'league_users'
  	resources :players
    resources :draft_picks, only: [:index, :show]
    get 'draft_order', to: 'leagues#show_draft_order', as: 'league_draft_order'
    put 'draft_order', to: 'leagues#update_draft_order', as: 'update_league_draft_order'
  end
end
