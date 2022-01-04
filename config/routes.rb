# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  root to: 'pages#index'
  resources :maps
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
