Muudle::Application.routes.draw do |map|
  devise_for :users
  resources :users
  resources :microposts, :only => [:edit, :create, :destroy]

  # Duplicate to ensure /about isn't mistaken for user 'about' !!
  match '/about',   :to => 'pages#about'

  # Makes muudle.com/<Username> possible
  map.resources :users, :as => '', :only => [:show]
  map.resources :users

  root              :to => 'pages#home'
  match '/about',   :to => 'pages#about'

  get "pages/home"
  get "pages/about"
  get "users/show"
  get "users/index"
end
