Muudle::Application.routes.draw do

  match '/home', :to => 'pages#home'
  match '/about',   :to => 'pages#about'

  get "pages/home"
  get "pages/about"
end
