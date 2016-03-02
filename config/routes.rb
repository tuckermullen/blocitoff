Rails.application.routes.draw do
  get 'items/create'

  devise_for :users

  resources :users do
    resources :items, only: [:create]
    # POST '/users/:user_id/items', controller: 'items', action: 'create'
  end
  get 'welcome/index'
  root to: 'welcome#index'
end
