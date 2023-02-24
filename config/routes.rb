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

  delete '/groups/:id/remove_member/:user_id', to: 'groups#remove_member', as: 'remove_member'
  patch '/groups/:id/invite_member', to: 'groups#invite_member', as: 'invite_member'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
end