Rails.application.routes.draw do
  #Update Routes

  devise_for :users , controllers: {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register"}  
  resources :users, only: [:new, :create, :edit, :update]
  resources :pages
  resources :profile

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
