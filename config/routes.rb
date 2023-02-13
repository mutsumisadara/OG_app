Rails.application.routes.draw do
  get 'animal_managements/new'
  devise_for :users
  # root to: 'users#sign_up'
  resources :users
  resources :groups
  resources :animals
end