Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'groups#index'
  # root to: 'users#sign_up'
  resources :comment_rooms
  resources :comments
  resources :schedules
  resources :users
  resources :groups
  resources :animals do
    resources :animal_managements
  end
end