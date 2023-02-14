Rails.application.routes.draw do
  # post '/animals/:animal_id/animal_managements/:id' => 'animal_managements#create'
  devise_for :users
  # root to: 'users#sign_up'
  resources :users
  resources :groups
  resources :animals do
    resources :animal_managements
  end
end