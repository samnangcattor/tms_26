Rails.application.routes.draw do
  root  "static_pages#home"
  get  "login"  => "sessions#new"
  post  "login"  => "sessions#create"
  delete  "logout"  => "sessions#destroy"
  resources :users
  namespace :supervisor do
    root  "courses#index"
    resources :users
    resources :courses do
      resource :assign_users
    end
    resources :subjects
  end
end
