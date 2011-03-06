Muudle::Application.routes.draw do |map|
  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts,    :only => [:edit, :create, :destroy]
  resources :relationships, :only => [:create, :destroy]

  root              :to => 'pages#frontPage'

  # Duplicate to ensure /about isn't mistaken for user 'about' !!
  match '/about',   :to => 'pages#about'
  match '/home',    :to => 'pages#home'

  # Makes muudle.com/<Username> possible
  map.resources :users, :as => '', :only => [:show]
end
