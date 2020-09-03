Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #Update Routes

  devise_for :users , controllers: { :omniauth_callbacks =>'users/omniauth_callbacks',
                                      :registrations => 'registrations'}
  resources :users, only: [:new, :create, :edit, :update]
  resources :pages
  resources :profile
  resources :contact, only: [:contattaci, :new, :create]
  resources :recipes do
    resources :reviews
  end
  root to: 'pages#home'
  root 'pages#home'
  get 'recipes' =>'recipes#new'
  get 'descrizione' => 'pages#descrizione' 
  get 'help' => 'pages#help' 
  get 'contattaci' => 'contact#contattaci'
  get 'regolamento' => 'pages#regolamento'
  get 'classifica' => 'pages#classifica'
  get 'login' => 'pages#login'
  get 'sceglicategoria' => 'scegli#select'
  get 'pasto' => 'scegli#pasto'
  get 'ricette' => 'recipes#ricette'

end
