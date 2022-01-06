# frozen_string_literal: true

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
