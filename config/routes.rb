# frozen_string_literal: true

Rails.application.routes.draw do
  
  # Authentication
  devise_for :users, {}

  # Application
  root to: 'home#index'
end
