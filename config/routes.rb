Rails.application.routes.draw do
  devise_for :users

  namespace :user do
    root :to => "groups#index"
  end

  root 'home#splash', as: 'splash'
  resources :groups, only: [:index, :new, :create]

end
