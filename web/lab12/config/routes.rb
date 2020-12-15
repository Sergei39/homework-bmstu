Rails.application.routes.draw do
  root 'manager#input'
  get 'manager/input'
  get 'manager/output'
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
