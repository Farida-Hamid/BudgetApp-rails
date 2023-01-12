Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/new'
  get 'payments/create'
  devise_for :users

  namespace :user do
    root :to => "groups#index"
  end

  root 'home#splash', as: 'splash'
  resources :groups, only: [:index, :new, :create]

end
