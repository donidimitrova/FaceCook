Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #Update Routes

  devise_for :users , controllers: { :omniauth_callbacks =>'users/omniauth_callbacks',
                                      :registrations => 'registrations'}
  resources :users, only: [:new, :create, :edit, :update]
  resources :pages
  resources :profile
<<<<<<< HEAD
  resources :recipes
=======
  resources :contact, only: [:contattaci, :new, :create]
>>>>>>> e136735d3f9f20d20f0938b51fd705ef8c71c79b

  root to: 'pages#home'
  root 'pages#home'

  get 'descrizione' => 'pages#descrizione' 
  get 'help' => 'pages#help' 
  get 'contattaci' => 'contact#contattaci'
  get 'regolamento' => 'pages#regolamento'
  get 'classifica' => 'pages#classifica'
  get 'login' => 'pages#login'
  get 'sceglicategoria' => 'scegli#select'
  get 'pasto' => 'scegli#pasto'
  get 'colazione' => 'pages#colazione'
  get 'pranzo' => 'pages#pranzo'
  get 'cena' => 'pages#cena'

end
