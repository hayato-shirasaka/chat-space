Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resouces :messages
  resouces :groups, only: [:new, :create]
end
