# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events do
    resources :games, only: %i[new create index] do
      post 'bgg_search', on: :collection
    end
    member do
      get :participants
      get :my_skills
    end
    resources :zones, except: [:show] do
      resources :missions do
        resources :assignments, only: %i[create destroy]
      end
    end
  end

  resources :participations, only: :update
  resources :skills, only: %i[create update]
  resource :planning, only: [:show], controller: :plannings
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
