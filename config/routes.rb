Rails.application.routes.draw do

  devise_for :users  
 
  root 'contacts#index'
  
  resources :users
  resources :contacts
 
end