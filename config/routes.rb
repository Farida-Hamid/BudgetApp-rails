Rails.application.routes.draw do
  get 'group/index'
  get 'group/new'
  devise_for :users

  namespace :user do
    root :to => "groups#index"
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#splash', as: 'splash'
  get "/groups/:id", to: "groups#index"
  get '/users/sign_out'

end
