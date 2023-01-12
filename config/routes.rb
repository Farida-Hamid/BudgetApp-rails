Rails.application.routes.draw do
  # get 'payments/index'
  # get 'payments/new'
  # get 'payments/create'
  get 'users/groups'
  get 'users/operations'
  devise_for :users

  namespace :user do
    root :to => "groups#index"
  end

  root 'home#splash', as: 'splash'
  resources :users, only: [ :index, :show] do
    resources :groups, only: [:index, :new, :create]
    resources :payments, only: [:index, :new, :create]
  end

end
