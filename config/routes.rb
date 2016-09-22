Rails.application.routes.draw do

  resources :themes
  get 'work/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
    
  resources :values
  resources :images
  resources :microposts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  match 'index',    to: 'main#index',           via: 'get'
  match 'about',    to: 'main#about',           via: 'get'
  match 'help',     to: 'main#help',            via: 'get'
  match 'contacts', to: 'main#contacts',        via: 'get'
  
  match 'work',             to: 'work#index',             via: 'get'
  match 'choose_image',     to: 'work#choose_image',      via: :get
  match 'choose_theme',     to: 'work#choose_theme',      via: :get
  match 'display_theme',    to: 'work#display_theme',     via: :post
  match 'next_image',       to: 'work#next_image',   via: 'get'
  match 'prev_image',       to: 'work#prev_image',   via: 'get'
  match 'results_list',      to: 'work#results_list', via: :get

  match 'signup',   to: 'users#new',            via: 'get'
  match 'signin',   to: 'sessions#new',         via: 'get'
  match 'signout',  to: 'sessions#destroy',     via: 'delete'


end
