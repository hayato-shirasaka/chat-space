Rails.application.routes.draw do
  root 'groups#index'

  devise_for :users

  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end

  resources :users, only: [:index]
end
