Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  get 'welcome/index'

  root to: 'users#show'


end
