Rails.application.routes.draw do
  devise_for :users

  namespace :user do
    root :to => "groups#index"
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#splash', as: 'splash'
  # get "/groups/:id", to: "groups#index"
  resources :groups, only: [:index, :new, :create]

end
