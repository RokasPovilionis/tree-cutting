# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
  root to: 'pages#index'
  resources :maps
  resources :leidimai
  resources :cutting_violation_reports
  resources :permit_location_subscriptions, only: %i[new create]
  authenticated :user, ->(user) { user.roles == 'admin' } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
