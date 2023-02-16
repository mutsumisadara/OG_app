Rails.application.routes.draw do
  devise_for :users
  # root to: 'users#sign_up'
  resources :schedules
  resources :users
  resources :groups
  resources :animals do
    resources :animal_managements
  end
  resources :schedules
  resources :comment_rooms
  resources :comments
end