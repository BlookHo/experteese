Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
    
  resources :values
  resources :images
  resources :microposts
  resources :users
  
  get 'main/index'
  get 'main/help'
  get 'main/contacts'
  get 'main/about'



end
