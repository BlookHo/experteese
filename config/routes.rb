Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  resources :values
  resources :images
  resources :microposts
  resources :users
  
  get 'main/index'
  get 'main/help'

  root 'main#index'

end
