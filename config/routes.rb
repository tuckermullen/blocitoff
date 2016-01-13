Rails.application.routes.draw do
  devise_for :users
  # /users/edit

  resources :users
  # /users/
  # /users/:id

  get 'welcome/index'

  root to: 'welcome#index'


end
