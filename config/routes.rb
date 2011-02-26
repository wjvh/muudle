Muudle::Application.routes.draw do
  devise_for :users

  root :to => 'pages#home'
  match '/about',   :to => 'pages#about'

  get "pages/home"
  get "pages/about"
end
