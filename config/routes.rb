Rails.application.routes.draw do
  root  "static_pages#home"
  get  "login"  => "sessions#new"
  post  "login"  => "sessions#create"
  delete  "logout"  => "sessions#destroy"
  resources :users, only: [:show, :edit, :update] do
    resource :assigned_courses, only: [:show]
  end
  resources :courses, only: [:show]
  namespace :supervisor do
    root  "courses#index"
    resources :users
    resources :courses do
      resource :assign_users, only: [:show, :update]
    end
    resources :subjects
  end
  resources :user_subjects
end
