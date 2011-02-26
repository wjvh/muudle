Muudle::Application.routes.draw do
  devise_for :users
  resources :users

  root              :to => 'pages#home'
  match '/about',   :to => 'pages#about'

  get "pages/home"
  get "pages/about"
  get "users/show"
  get "users/index"
end
