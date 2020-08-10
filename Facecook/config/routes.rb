Rails.application.routes.draw do
  #Update Routes

  devise_for :users , controllers: { :omniauth_callbacks =>'users/omniauth_callbacks',
                                      :registrations => 'registrations'}
  resources :users, only: [:new, :create, :edit, :update]
  resources :pages
  resources :profile

  root to: 'pages#home'
  root 'pages#home'


  get 'descrizione' => 'pages#descrizione' 
  get 'help' => 'pages#help' 
  get 'contact' => 'pages#contact'
  get 'regolamento' => 'pages#regolamento'
  get 'classifica' => 'pages#classifica'
  get 'login' => 'pages#login'
  get 'sceglicategoria' => 'scegli#select'

end
