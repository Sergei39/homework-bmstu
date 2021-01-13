Rails.application.routes.draw do
  root 'manager#input'
  get 'manager/input', as: 'manager_input'
  get 'manager/output', as: 'manager_output'
  get 'session/login'
  post 'session/create'
  get 'session/logout'

  resources :session, only: [:new, :create, :destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
