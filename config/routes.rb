Rails.application.routes.draw do
  resources :users

  devise_for :users
  get 'welcome/index'

  root to: 'users#show'


end
