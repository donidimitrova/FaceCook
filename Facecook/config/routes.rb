Rails.application.routes.draw do
  #Update Routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  root 'pages#home'
  get 'help' => 'pages#help' 
  get 'about' => 'pages#about' 
  get 'contact' => 'pages#contact'
  get 'regolamento' => 'pages#regolamento'
  get 'classifica' => 'pages#classifica'
  get 'login' => 'pages#login'
  get 'sceglicategoria' => 'scegli#select'

end
