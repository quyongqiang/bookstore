Rails.application.routes.draw do
 
  root 'books#index'


  get 'about' => 'about#index' 

  resources :books
  resources :categories
  resources :authors
  resources :publishers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
