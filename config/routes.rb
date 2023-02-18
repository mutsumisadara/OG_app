Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/password'
  }

  resources :comment_rooms
  resources :comments
  resources :schedules
  resources :users
  resources :groups
  resources :animals do
    resources :animal_managements
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
end